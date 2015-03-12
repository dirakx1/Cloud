INTRODUCTION
------------

Here is the configuration test an usage of the S3 account
this has to be done inside the cloud instances.

.. code::

[root@euca-xx-xxx-xx-xxx ~]# yum install s3cmd
 Or alternatively, install latest version from git repository


Create an s3cmd configuration file
----------------------------------


.. code-block::

[root@euca-xx-xxx-xx-xxx ~]# cat >~/.s3cfg
<<Paste the contents of an s3cfg example here
Ctrl-D to end

Create a bucket
---------------

.. code-block::

Please note that the bucket name needs to be globally unique. So if you create a bucket called "test", some other user may have created a bucket with the same name already and bucket creation will fail. One of the reasons for the uniqueness requirements is that resources in S3 can be shared using HTTP urls and the bucket name acts as a key inside the URL to give a namespace for resources. This way, two buckets can contain a resource called, e.g. "index.html". Bucket names should be written with lowercase letters and they should be usable as a DNS name (like "mybucket.s3demo.nsn-net.net").
 [root@euca-xx-xxx-xx-xxx ~]# s3cmd mb s3://test-bucket
 Bucket 's3://test-bucket/' created

Upload an object
----------------

.. code-block::

  [root@euca-xx-xxx-xx-xx ~]# s3cmd put /etc/lsb-release s3://test-bucket
  /etc/lsb-release -> s3://test-bucket/lsb-release  [1 of 1]
  74 of 74   100% in    0s  1967.25 B/s  done


Verify that the object exists
-----------------------------

.. code-block::

  [root@euca-xx-xxx-xx-xxx ~]# s3cmd la
  2014-12-17 09:31        74   s3://test-bucket/lsb-release


Get and view the object
-----------------------

.. code-block::

 [root@euca-xx-xxx-xx-xxx ~]# s3cmd get s3://test-bucket/lsb-release test
 s3://test-bucket/lsb-release -> test  [1 of 1]
 74 of 74   100% in    0s     2.06 kB/s  done
 [root@euca-14-255-75-235 ~]# cat test
 LSB_VERSION=base-4.0-amd64:base-4.0-noarch:core-4.0-amd64:core-4.0-noarch

Use s3 to make an static webpage
................................

.. code-block::

 s3cmd put index.html s3://demo1.privatecloud
 s3cmd --acl-public --recursive setacl s3://demo1.privatecloud

