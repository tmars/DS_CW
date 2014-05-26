@echo off
mysql -u root < db/refresh.sql
mysql -u root -D rsoi_office_sys < db/office_sys.sql
mysql -u root -D rsoi_center_sys < db/center_sys.sql