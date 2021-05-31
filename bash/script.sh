#!/bin/bash

# TODO: add rkdevtools checking here
# TODO: track beginning of the database header:  0  16  The header string: "SQLite format 3\000"

SQL_HEADER_STRING="SQLite format 3"
# RAW_FILE='htm_database.sqlite'
RAW_FILE="raw_file"

# From here one get an array of databases 
DATABASES_ARRAY=$(grep -boa "${SQL_HEADER_STRING}"  "${RAW_FILE}")

while read -r line; do
    BEGIN_DATABASE="${line//:${SQL_HEADER_STRING}/}"
    echo "${BEGIN_DATABASE}"
    SQL_PAGE_SIZE=$(xxd -p -l 2 -s $((16 + BEGIN_DATABASE))  "${RAW_FILE}")
    NUMBER_OF_PAGES=$(xxd -p -l 4 -s $((28 + BEGIN_DATABASE))  "${RAW_FILE}")

    DATABASE_SIZE=$((0x${SQL_PAGE_SIZE} *  0x${NUMBER_OF_PAGES}))
    echo "page size: ${SQL_PAGE_SIZE}"
    echo "number of pages: ${NUMBER_OF_PAGES}"
    echo "database size file: ${DATABASE_SIZE}"

    DATABASE_FILE='test.sql'
    head -c ${DATABASE_SIZE} ${RAW_FILE} > ${DATABASE_FILE}

done <<< "${DATABASES_ARRAY}"


# SQL_PAGE_SIZE=$(xxd -p -l 2 -s 16  "${RAW_FILE}")
# NUMBER_OF_PAGES=$(xxd -p -l 4 -s 28  "${RAW_FILE}")
# 
# DATABASE_SIZE=$((0x${SQL_PAGE_SIZE} *  0x${NUMBER_OF_PAGES}))
# echo "page size: ${SQL_PAGE_SIZE}"
# echo "number of pages: ${NUMBER_OF_PAGES}"
# echo "database size file: ${DATABASE_SIZE}"
# 
# DATABASE_FILE='test.sql'
# head -c ${DATABASE_SIZE} ${RAW_FILE} > ${DATABASE_FILE}
# 
# DATABASE="db1"
# CPU_TEMP_TABLE="${DATABASE}.cpu_temp_exceedance_final"
# DISPLAY_TEMP_TABLE="${DATABASE}.display_temp_exceedance_final"
# 
# __mock_db_inputs()
# (
# for i in $(seq 1 10);
# do
#     start_time=$(shuf -i1-500 -n1)
#     end_time=$(shuf -i1-500 -n1)
#     time_diff=$(shuf -i1-500 -n1)
#     temperature=$(awk -v n=10 -v seed="$RANDOM" 'BEGIN { srand(seed); printf("%.4f\n", 10*rand()) }')
# 
#     sqlite3  << END_SQL
# .timeout 2000
# ATTACH ${DATABASE_FILE} as ${DATABASE};
# INSERT INTO ${DISPLAY_TEMP_TABLE} VALUES("report_display_temp_$i", ${start_time}, ${end_time}, ${time_diff}, ${temperature});
# INSERT INTO ${CPU_TEMP_TABLE} VALUES("report_cpu_temp_$i", ${start_time}, ${end_time}, ${time_diff}, ${temperature});
# END_SQL
# done
# )
# 
# DISPLAY_TEMP_VALUES=$(sqlite3  << END_SQL
# .timeout 2000
# ATTACH "${DATABASE_FILE}" as ${DATABASE};
# SELECT * FROM ${DISPLAY_TEMP_TABLE};
# END_SQL
# )
# 
# CPU_TEMP_VALUES=$(sqlite3  << END_SQL
# .timeout 2000
# ATTACH "${DATABASE_FILE}" as ${DATABASE};
# SELECT * FROM ${CPU_TEMP_TABLE};
# END_SQL
# )
# 
# SPLIT=$(printf "%-100s" "*")
# 
# echo "${SPLIT// /*}"
# echo "Display Temperature Exceedance"
# echo "${SPLIT// /*}"
# printf "%-25s %-20s %-20s %-20s %-20s\r\n" "report_id" "start_time"  "end_time" "time_diff" "temperature"
# 
# while read -r line; do
#     echo "${line}" | awk -F'|' '{printf ("%-25s %-20s %-20s %-20s %-20s\r\n" , $1, $2, $3, $4, $5)}' 
# done <<< "$DISPLAY_TEMP_VALUES"
# 
# echo ""
# echo "${SPLIT// /*}"
# echo "CPU Temperature Exceedance"
# echo "${SPLIT// /*}"
# printf "%-25s %-20s %-20s %-20s %-20s\r\n" "report_id" "start_time"  "end_time" "time_diff" "temperature"
# 
# while read -r line; do
#     echo "${line}" | awk -F'|' '{printf ("%-25s %-20s %-20s %-20s %-20s\r\n" , $1, $2, $3, $4, $5)}' 
# done <<< "$CPU_TEMP_VALUES"
# 
# # rm ${DATABASE_FILE}
