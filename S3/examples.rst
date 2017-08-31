# to be putted on a crontab

pg_dumpall |gzip > /home/user/backups/database/allbackup.gzip
pg_dump goal |gzip > /home/user/backups/database/db.gz
s3cmd put /home/user/backups/database/allbackup.gzip s3://db-backup
s3cmd put /home/user/backups/db.gz s3://db-backup

# rm a bcket and its contents 

* s3cmd -c s3cfg_US rm --recursive --force s3://nameofbucket
