@echo off
mysqldump rsoi_office_sys -u root > db/office_sys.sql
mysqldump rsoi_center_sys -u root > db/center_sys.sql