# To be put on a crontab

pg_dumpall |gzip > /home/user/backups/database/allbackup.gzip
pg_dump goal |gzip > /home/user/backups/database/db.gz
s3cmd put /home/user/backups/database/allbackup.gzip s3://db-backup
s3cmd put /home/user/backups/db.gz s3://db-backup

# rm a bcket and its contents 

* s3cmd -c s3cfg_US rm --recursive --force s3://nameofbucket

# mv a bucket or object

* s3cmd -c s3cfg_NUS mv --recursive s3://upload_history/2014 s3://upload_history1
