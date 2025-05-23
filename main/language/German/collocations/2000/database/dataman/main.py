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
    command = "INSERT IGNORE INTO collocations (item, example, explanation1, explanation2, class) VALUES (%s, %s, %s, %s, %s)"  #4th
    cursor.executemany(command,data_list)
    connector.commit()
    print(cursor.rowcount,"success!")
    cursor.execute("ALTER TABLE collocations DROP id")  #5th
    cursor.execute("ALTER TABLE collocations ADD id INT UNSIGNED NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (id)")  #6th
    cursor.close
    connector.close
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
    cursor.execute("CREATE TABLE IF NOT EXISTS `collocations`(`id` INT UNSIGNED AUTO_INCREMENT, `item` VARCHAR(80) NOT NULL, `example` VARCHAR(100) NOT NULL, `explanation1` VARCHAR(80) NOT NULL, `explanation2` VARCHAR(80) NOT NULL, `class` VARCHAR(3) NOT NULL, PRIMARY KEY (`id`), UNIQUE (`item`,`example`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;")   #11th
    print("success!")
    cursor.close
    connector.close
    return


##########
main()
