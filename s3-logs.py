# -*- coding: utf-8 -*-
#https://console.aws.amazon.com/s3/home?
#http://readthedocs.org/docs/boto/en/latest/s3_tut.html
#http://readthedocs.org/docs/boto/en/latest/ref/s3.html
#http://code.google.com/p/boto/wiki/BotoConfig

from optparse import OptionParser
import os
import math
import time
from filechunkio import FileChunkIO
from boto.s3.connection import S3Connection
from boto.s3.key import Key


AWS_ACCESS_KEY_ID = '********' # your key id
AWS_SECRET_ACCESS_KEY = '*********' # your access id
BUCKET_NAME = 'docker-logs'
CHUNK_SIZE = 52428800  # 50 MiB


def get_db_bucket():
    print 'Connecting...'
    conn = S3Connection(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
    bucket = conn.get_bucket(BUCKET_NAME)
    return bucket


def get_db_key(key_name):
    bucket = get_db_bucket()
    print 'Done'
    k = Key(bucket)
    k.key = key_name
    return k


def upload_daily_db_backup(filepath):
    bucket = get_db_bucket()
    # Get file info
    file_size = os.stat(filepath).st_size

    # Create a multipart upload request
    mp = bucket.initiate_multipart_upload(os.path.basename(filepath))

    # Use a chunk size of 50 MiB (feel free to change this)
    chunk_count = int(math.ceil(file_size / float(CHUNK_SIZE)))

    # Send the file parts, using FileChunkIO to create a file-like object
    # that points to a certain byte range within the original file. We
    # set bytes to never exceed the original file size.
    start = time.clock()
    print 'Starting Uploading...'
    for i in range(chunk_count):
        offset = CHUNK_SIZE * i
        count = i + 1
        file_bytes = min(CHUNK_SIZE, file_size - offset)
        with FileChunkIO(filepath, 'r', offset=offset,
                         bytes=file_bytes) as fp:
            print 'Uploading... file part %s-%s' % (count, chunk_count)
            mp.upload_part_from_file(fp, part_num=count)
            print 'Finished to upload part %s-%s' % (count, chunk_count)

    # Finish the upload
    mp.complete_upload()
    finish = time.clock()
    print 'Done: %s' % ((finish - start) / 60)


def download_daily_db_backup(filepath):
    k = get_db_key(os.path.basename(filepath))
    print 'Downloading...'
    start = time.clock()
    k.get_contents_to_filename(filepath)
    finish = time.clock()
    print 'Done: %s' % ((finish - start) / 60)


if __name__ == '__main__':
    parser = OptionParser()
    parser.add_option('-f', '--file', dest='FILE')  #path of the file to be uploaded can be logs or others
    options, _ = parser.parse_args()
    upload_daily_db_backup(options.FILE)
    download_daily_db_backup()
