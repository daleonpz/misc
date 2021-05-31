#!/bin/bash


__show_data_base()
(
DATABASE="db1"
CPU_TEMP_TABLE="${DATABASE}.cpu_temp_exceedance_final"
DISPLAY_TEMP_TABLE="${DATABASE}.display_temp_exceedance_final"

DISPLAY_TEMP_VALUES=$(sqlite3  << END_SQL
.timeout 2000
ATTACH "$1" as ${DATABASE};
SELECT * FROM ${DISPLAY_TEMP_TABLE};
END_SQL
)

CPU_TEMP_VALUES=$(sqlite3  << END_SQL
.timeout 2000
ATTACH "$1" as ${DATABASE};
SELECT * FROM ${CPU_TEMP_TABLE};
END_SQL
)

SPLIT=$(printf "%-100s" "*")

echo "${SPLIT// /*}"
echo "Display Temperature Exceedance"
echo "${SPLIT// /*}"
printf "%-25s %-20s %-20s %-20s %-20s\r\n" "report_id" "start_time"  "end_time" "time_diff" "temperature"

while read -r line; do
    echo "${line}" | awk -F'|' '{printf ("%-25s %-20s %-20s %-20s %-20s\r\n" , $1, $2, $3, $4, $5)}' 
done <<< "$DISPLAY_TEMP_VALUES"

echo ""
echo "${SPLIT// /*}"
echo "CPU Temperature Exceedance"
echo "${SPLIT// /*}"
printf "%-25s %-20s %-20s %-20s %-20s\r\n" "report_id" "start_time"  "end_time" "time_diff" "temperature"

while read -r line; do
    echo "${line}" | awk -F'|' '{printf ("%-25s %-20s %-20s %-20s %-20s\r\n" , $1, $2, $3, $4, $5)}' 
done <<< "$CPU_TEMP_VALUES"
)


# TODO: add rkdevtools checking here
# TODO: track beginning of the database header:  0  16  The header string: "SQLite format 3\000"

SQL_HEADER_STRING="SQLite format 3"
# RAW_FILE='htm_database.sqlite'
RAW_FILE="raw_file"

# From here one get an array of databases 
DATABASES_ARRAY=$(grep -boa "${SQL_HEADER_STRING}"  "${RAW_FILE}")

while read -r line; do
    BEGIN_DATABASE="${line//:${SQL_HEADER_STRING}/}"
    echo "--------------------------------------------"
    echo "Index begin of Database: ${BEGIN_DATABASE}"
    SQL_PAGE_SIZE=$(xxd -p -l 2 -s $((16 + BEGIN_DATABASE))  "${RAW_FILE}")
    NUMBER_OF_PAGES=$(xxd -p -l 4 -s $((28 + BEGIN_DATABASE))  "${RAW_FILE}")

    DATABASE_SIZE=$((0x${SQL_PAGE_SIZE} *  0x${NUMBER_OF_PAGES}))
    echo "page size: ${SQL_PAGE_SIZE}"
    echo "number of pages: ${NUMBER_OF_PAGES}"
    echo "database size file: ${DATABASE_SIZE}"

    DATABASE_FILE='test.sql'
    head -c ${DATABASE_SIZE} ${RAW_FILE} > ${DATABASE_FILE}

    __show_data_base ${DATABASE_FILE}

    rm ${DATABASE_FILE}
done <<< "${DATABASES_ARRAY}"

