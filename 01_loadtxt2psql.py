'''
============================   INSTRUCTIONS    ========================================

Python 3 script to import csv file to PostgreSQL

Configure import in "CONFIGURE SCRIPT HERE" below.

'''

import csv
import os
import sys
import psycopg2


################################ CONFIGURE SCRIPT HERE : BEGIN ################################
postgres_path = '/var/lib/postgresql'
os_user_login = os.getlogin() # it is gotten automatically
os_user_password = 'your_password'
hostname_address = 'localhost'
db_username = 'postgres'
db_password = 'postgres'
db_name = 'ibge_censo2022_addr_coord'
path_to_scv_file = '/path/to/your/file.txt'
first_line_is_header = False # True or False
delimiter = ',' # It has to be comma ','
values4sqlfile = 10000 # amount of values by each sql inserting execution. Depends on your computer capacity

# run script with > python3 *.py

################################ CONFIGURE SCRIPT HERE : END ####################################

def executesqlcommand(db_name,sql):
  recset = []
  con = psycopg2.connect(host=hostname_address, database=db_name, user=db_username, password=db_password)
  cur = con.cursor()
  cur.execute(sql)
  try: recset = cur.fetchall()  # Check if query brings a table
  except: pass                  # if not, just ignore it
  con.commit()
  cur.close()
  con.close()
  return recset 

def createdb():
  ### Create database
  sql = 'CREATE DATABASE '+db_name+';'
  command_linuxbash = 'cd ' + postgres_path + ' && echo "' + os_user_password + '" | sudo -S -u ' + db_username + ' psql -c ' + '"' + sql + '"'
  os.system(command_linuxbash)
  ### Create extensions
  sql = 'CREATE EXTENSION IF NOT EXISTS postgis; CREATE EXTENSION IF NOT EXISTS postgis_topology; CREATE EXTENSION IF NOT EXISTS hstore; CREATE EXTENSION IF NOT EXISTS dblink;'
  executesqlcommand(db_name,sql)

def loadCSV2DB(csvfile, delimiter, firstlineisheader):
    tablename = csvfile[:-4].split('/')[-1]
    linecounter = 0
    sqlfilevalues = csvfile[:-4] + '.sqlvalues'
    
    with open(csvfile, 'r', encoding='utf-8', errors='ignore') as file:
        reader = csv.reader(file, delimiter=delimiter)
        fieldsnames = []
        fieldcounter = []

        with open(sqlfilevalues, 'w') as fsqlv:
            for row in reader:
                try:
                    linecounter += 1
                    if linecounter == 1:
                        if firstlineisheader:
                            fieldsnames = row
                    else:
                        fields = row
                        fieldcounter.append(len(fields))
                        # Fill sql file with the fields values
                        fsqlv.write("('" + "','".join(fields) + "'),\n")
                except Exception as e:
                    print(f"SKIPPED line {linecounter}: {e}")
    
    if not firstlineisheader:
        numberoffields = max(set(fieldcounter), key=fieldcounter.count)
        for i in range(1, numberoffields + 1):
            fieldsnames.append('field' + str(i).zfill(3))
    
    # Divide SQL Values File into multiple files
    line_count = sum(1 for line in open(sqlfilevalues))
    sqlinsertheader = 'INSERT INTO "' + tablename + '" ("' + '","'.join(fieldsnames) + '") VALUES \n'
    sqlfilesfolder = csvfile[:-4] + '.sql'
    
    if not os.path.exists(sqlfilesfolder):
        os.makedirs(sqlfilesfolder)
    
    with open(sqlfilevalues, 'r') as fsqlv:
        linescounter = 0
        filecounter = 1
        currentsqlfile = ''
        fcsql = None

        for line in fsqlv:
            linescounter += 1
            if linescounter == 1 or linescounter % values4sqlfile == 0:  # Create and fill new file
                if fcsql:
                    fcsql.close()
                currentsqlfile = os.path.join(sqlfilesfolder, f'{str(filecounter).zfill(10)}.sql')
                filecounter += 1
                fcsql = open(currentsqlfile, 'w')
                fcsql.write(sqlinsertheader)
            
            if linescounter == line_count or (linescounter + 1) % values4sqlfile == 0:  # Last line or last line in each divided sql file
                fcsql.write(line[:-2] + ';\n')
                fcsql.close()
                fcsql = None
            else:
                fcsql.write(line[:-1] + '\n')

        if fcsql:
            fcsql.close()

    # Create table
    sqlcreatetable = 'CREATE TABLE IF NOT EXISTS "' + tablename + '" (' + ', '.join(f'"{col}" TEXT' for col in fieldsnames) + ');'
    executesqlcommand(db_name, sqlcreatetable)

    # Load SQL files to DB
    sqlfileslist = [os.path.join(sqlfilesfolder, file) for file in os.listdir(sqlfilesfolder)]
    sqlfileslist.sort()
    
    for sqlfile in sqlfileslist:
        with open(sqlfile, 'r') as fsql:
            executesqlcommand(db_name, fsql.read())

createdb()
loadCSV2DB(path_to_scv_file,delimiter,first_line_is_header)








