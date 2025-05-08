function remove_id()
{
	awk -F',' '{ if ($0 ~ /^\[/) {printf "["; for (i=2; i<=NF; i++) {printf "%s%s", $i, (i<NF)? "," : ""; } print ""} else print}' ../$1 > $2
}

function db_dump()
{
	mysqldump -u $1 -p$2 --skip-extended-insert $3 $4 > ../$5
	cat ../$5 | awk 'BEGIN {print "list = ["} /^INSERT INTO/ {split($0, a, "VALUES"); print "[" substr(a[2], 3, length(a[2])-4) "],"} END {print "]"}' > ../$6
}

function recover_quotes()
{
	awk '{ gsub(/\\\047/, "^");  gsub(/\047/, "\""); gsub(/\^/, "\047"); print }' ../$1 > ../$2
	rm ../$1
}

## remove id
input="list.js"
output="list.py"
remove_id $input $output

## save data
python main.py

## extract data
user="maxwell"			#1st
password="913"			#2nd
database="language"		#3rd
table="adjectives"		#4th
output_sql="list.sql"
output_js="list_temp.js"
db_dump $user $password $database $table $output_sql $output_js

## recover quotes
input='list_temp.js'
output='list.js'
recover_quotes $input $output