import MySQLdb
import list

def main():
    RefreshDatabase()
    InsertData(list.list)

def InsertData(data_list):
    connector = MySQLdb.connect(
            user='maxwell',     #1st
            passwd='913',       #2nd 
            host='localhost',
            db='language',      #3rd
            charset='utf8')
    cursor = connector.cursor()
    command = "INSERT IGNORE INTO list (column1, column2, column3, column4) VALUES (%s, %s, %s, %s)"
    
    success_count = 0
    failure_count = 0
    for i, data in enumerate(data_list, 1):
        try:
            cursor.execute(command, data)
            if cursor.rowcount > 0:
                success_count += 1
            else:
                failure_count += 1
        except Exception as e:
            print(f">> Error at line {i}: {e}")
            print(f">> Problematic data: {data}")
            print(f">> Nothing saved!")
            return
    connector.commit()
    print(f">> {success_count} saved successfully! ({failure_count} duplicates found)")
    cursor.execute("ALTER TABLE list DROP id")
    cursor.execute("ALTER TABLE list ADD id INT UNSIGNED NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (id)")
    cursor.close()
    connector.close()
    return
   
def RefreshDatabase():
    connector = MySQLdb.connect(
            user='maxwell', #4th
            passwd='913',   #5th
            host='localhost',
            db='language',  #6th
            charset='utf8')
    cursor = connector.cursor()
    cursor.execute("DROP TABLE IF EXISTS list;")
    cursor.execute("CREATE TABLE IF NOT EXISTS `list`(`id` INT UNSIGNED AUTO_INCREMENT, `column1` VARCHAR(80) NOT NULL, `column2` VARCHAR(100) NOT NULL, `column3` VARCHAR(100) NOT NULL, `column4` VARCHAR(80) NOT NULL, PRIMARY KEY (`id`), UNIQUE (`column1`,`column3`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;")
    print(">> Initialized successfully!")
    cursor.close
    connector.close
    return


##########
main()