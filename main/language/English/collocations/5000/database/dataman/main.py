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
    command = "INSERT IGNORE INTO collocations (item, synonym, example, explanation) VALUES (%s, %s, %s, %s)"  #4th
    
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
    cursor.execute("ALTER TABLE collocations DROP id")  #5th
    cursor.execute("ALTER TABLE collocations ADD id INT UNSIGNED NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (id)")  #6th
    cursor.close()
    connector.close()
    return
   
def RefreshDatabase():
    connector = MySQLdb.connect(
            user='maxwell', #7th
            passwd='913',   #8th
            host='localhost',
            db='language',  #9th
            charset='utf8')
    cursor = connector.cursor()
    cursor.execute("DROP TABLE IF EXISTS collocations;")    #10th
    cursor.execute("CREATE TABLE IF NOT EXISTS `collocations`(`id` INT UNSIGNED AUTO_INCREMENT, `item` VARCHAR(80) NOT NULL, `synonym` VARCHAR(100) NOT NULL, `example` VARCHAR(100) NOT NULL, `explanation` VARCHAR(80) NOT NULL, PRIMARY KEY (`id`), UNIQUE (`item`,`example`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;")   #11th
    print(">> Initialized successfully!")
    cursor.close
    connector.close
    return


##########
main()
