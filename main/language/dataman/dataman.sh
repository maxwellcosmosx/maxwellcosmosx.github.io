#!/bin/bash

# ============ 固定配置 ============
USER="maxwell"
PASSWORD="913"
DATABASE="language"
TABLE="list"

# ============ 函数定义 ============

function remove_id()
{
    awk -F',' '{ 
        if ($0 ~ /^\[/) {
            printf "[";
            for (i=2; i<=NF; i++) {
                printf "%s%s", $i, (i<NF)? "," : "";
            }
            print ""
        } else {
            print
        }
    }' "$1" > "$2"
}

function db_dump()
{
    local output_sql="$1"
    local output_js="$2"
    
    mysqldump -u "$USER" -p"$PASSWORD" --skip-extended-insert "$DATABASE" "$TABLE" > "$output_sql"
    
    if [ $? -ne 0 ]; then
        echo "[ERROR] MySQL dump failed"
        return 1
    fi
    
    cat "$output_sql" | awk 'BEGIN {print "list = ["} /^INSERT INTO/ {split($0, a, "VALUES"); print "[" substr(a[2], 3, length(a[2])-4) "],"} END {print "]"}' > "$output_js"
}

function recover_quotes()
{
    local input="$1"
    local output="$2"
    
    awk '{ gsub(/\\\047/, "^");  gsub(/\047/, "\""); gsub(/\^/, "\047"); print }' "$input" > "$output"
    rm "$input"
}

# ============ 帮助信息 ============

show_help() {
    cat << EOF
Usage: $0 [options] -i <input_file>

Description: One-click full process
  1. Remove ID field from input file, generate Python list
  2. Run main.py and save data into MySQL database
  3. Export MySQL data and convert to JS format
  4. Recover quotes conversion
  5. Remove temporary Python file
  6. Move final files to target directory (overwrite)

Fixed configuration:
  Database: $DATABASE
  Table:    $TABLE
  User:     $USER

Options:
  -i FILE   Specify input JS file path (required)
  -o DIR    Specify output directory (default: input file's directory)
  -h        Show this help message

Examples:
  $0 -i list.js
  $0 -i ../data/list.js -o ./output
  $0 -i /path/to/list.js -o /tmp/result

EOF
}

# ============ 主程序 ============

input_file=""
output_dir=""

while getopts "i:o:h" opt; do
    case $opt in
        i) input_file="$OPTARG" ;;
        o) output_dir="$OPTARG" ;;
        h) 
            show_help
            exit 0
            ;;
        *) 
            echo "[ERROR] Invalid option, use -h for help"
            exit 1
            ;;
    esac
done

if [ -z "$input_file" ]; then
    echo "[ERROR] Input file (-i) is required"
    echo "Use -h for help"
    exit 1
fi

if [ ! -f "$input_file" ]; then
    echo "[ERROR] Input file '$input_file' does not exist"
    exit 1
fi

# 如果未指定输出目录，默认使用输入文件所在目录
if [ -z "$output_dir" ]; then
    output_dir=$(dirname "$input_file")
fi

# 确保输出目录存在
mkdir -p "$output_dir"

input_basename=$(basename "$input_file")
input_name="${input_basename%.*}"

# 所有文件都在当前目录生成（临时文件）
output_py="${input_name}.py"
output_sql="${TABLE}.sql"
output_tmp="${TABLE}_tmp.js"
output_js="${TABLE}.js"

echo "=== Starting full process ==="
echo "Input file: $input_file"
echo "Target directory: $output_dir"
echo "Database: $DATABASE.$TABLE"
echo ""

echo "[1/5] Removing ID field, generating Python list"
remove_id "$input_file" "$output_py"
if [ $? -ne 0 ]; then
    echo "[ERROR] remove_id failed"
    exit 1
fi
echo "[OK] Python list generated: $output_py (current directory)"

echo ""
echo "[2/5] Running Python script"
if [ -f "main.py" ]; then
    python main.py
    if [ $? -ne 0 ]; then
        echo "[ERROR] Python script execution failed"
        exit 1
    fi
    echo "[OK] Python script completed"
else
    echo "[WARN] main.py not found, skipped"
fi

echo ""
echo "[3/5] Exporting database $DATABASE.$TABLE"
db_dump "$output_sql" "$output_tmp"
if [ $? -ne 0 ]; then
    exit 1
fi
echo "[OK] Database export completed: $output_sql -> $output_tmp (current directory)"

echo ""
echo "[4/5] Recovering quotes"
recover_quotes "$output_tmp" "$output_js"
if [ $? -ne 0 ]; then
    echo "[ERROR] recover_quotes failed"
    exit 1
fi
echo "[OK] Quotes recovered: $output_tmp -> $output_js (current directory)"

echo ""
echo "[5/6] Removing temporary Python file"
if [ -f "$output_py" ]; then
    rm "$output_py"
    echo "[OK] Removed: $output_py"
else
    echo "[WARN] $output_py not found, skipped"
fi

echo ""
echo "[6/6] Moving final files to target directory (overwrite)"
# 移动 JS 文件
if [ -f "$output_js" ]; then
    mv -f "$output_js" "$output_dir/"
    echo "[OK] Moved (overwrite): $output_js -> $output_dir/$output_js"
else
    echo "[ERROR] $output_js not found"
    exit 1
fi

# 移动 SQL 文件
if [ -f "$output_sql" ]; then
    mv -f "$output_sql" "$output_dir/"
    echo "[OK] Moved (overwrite): $output_sql -> $output_dir/$output_sql"
else
    echo "[ERROR] $output_sql not found"
    exit 1
fi

echo ""
echo "=== Full process completed ==="
echo ""
echo "Final files in target directory ($output_dir):"
echo "  [SQL]    $output_dir/$output_sql"
echo "  [JS]     $output_dir/$output_js"
echo ""
echo "Temporary files removed:"
echo "  [Python] $output_py (deleted)"