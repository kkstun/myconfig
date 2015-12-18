/opt/lampp/bin/mysqldump -uparcel -pparcel2015 parceldb > /home/parcel/sqlbackup/`date +%Y%m%d`.sql
find /home/parcel/sqlbackup/ -mtime +10 -name '*.sql' -exec rm -rf {} \;
