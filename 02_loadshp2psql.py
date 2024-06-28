'''
============================   DRAFT AREA    =====================================================

Import shapefiles to postgres

# write sql command using shp2pgsql
echo "mypassword" | sudo shp2pgsql -s 4326 file.shp > file.sql

'''

import os
import sys
import psycopg2


################################ CONFIGURE SCRIPT HERE ################################
postgres_path = '/var/lib/postgresql'
os_user_login = os.getlogin() # it is gotten automatically
os_user_password = 'your_os_password'
hostname_address = 'localhost'
db_username = 'postgres'
db_password = 'postgres'
db_name = 'ibge_censo2022_addr_coord' # Create DB if it not exists
src = '4326' # WGS-84 = 4326 # World Mercartor /WGS 84 = 3394
shps_directory = '/path/to/your/shps'

# run script with > python3 *.py

#######################################################################################


### Create database
sql = 'CREATE DATABASE '+db_name+';'
command_linuxbash = 'cd ' + postgres_path + ' && echo "' + os_user_password + '" | sudo -S -u ' + db_username + ' psql -c ' + '"' + sql + '"'
os.system(command_linuxbash)
### Create extensions
sql = 'CREATE EXTENSION IF NOT EXISTS postgis; CREATE EXTENSION IF NOT EXISTS postgis_topology; CREATE EXTENSION IF NOT EXISTS hstore; CREATE EXTENSION IF NOT EXISTS dblink;'
con = psycopg2.connect(host=hostname_address, database=db_name, user=db_username, password=db_password)
cur = con.cursor()
cur.execute(sql)
con.commit()
cur.close()
con.close()


shps_list = shps_directory + 'listofshapefiles.txt'
#### Create and clear file
f = open(shps_list,'w')
f.write('')
f.close()
#### Fill shapefile list into file
shp_file = ''
sql_file = ''
f = open(shps_list,'a')
for shapefile in os.listdir(shps_directory):
  if shapefile.endswith(".shp"):
    shp_file = (os.path.join(shps_directory, shapefile)) + '\n'
    f.write(shp_file)
f.close()



### Make .sql files and run them
with open(shps_list) as shplisttxt:
  for shp_file_in_list in shplisttxt:
    ### make sql files
    shp_file = shp_file_in_list[:-1]
    tablename =  (shp_file.replace(shps_directory,'')).replace('.shp','')
    commmand_shp2pgsql = 'echo "' + os_user_password + '" | sudo -S -u ' + os_user_login + ' shp2pgsql -s ' + src + ' '+ shp_file + ' > ' + shps_directory + tablename + '.sql'
    os.system(commmand_shp2pgsql)
    ### Run .sql files to make tables on database
    sql_file = shp_file_in_list[:-5] + '.sql'
    print('\n >> sql_file = '+sql_file)
    con = psycopg2.connect(host=hostname_address, database=db_name, user=db_username, password=db_password)
    cur = con.cursor()
    sql_file = open(sql_file,'r')
    cur.execute(sql_file.read())
    con.commit()
    cur.close()
    con.close()
    print('>>> ',tablename,' table has been created successfully <<<\n')


