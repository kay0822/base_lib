#!/bin/sh
source ./config.sh

function test_i18n(){
	Separator "i18n"
	#I18N_LANG="en_US"
	I18N_PROJ=("project" "项目")
	I18n I18N_PROJ
}
function test_insert_log(){
	Separator "insert_log"
	test_file=/tmp/test_insert_log.$$
	rm -f ${test_file}
	touch ${test_file}
	__header='printf "%10s %10s %10s\n" "title 1" "title 2" "title 3"'
	InsertLog "${test_file}" "${__header}" "%10s %10s %10s\n" "record1" "abcd" "1234"
	InsertLog "${test_file}" "${__header}" "%10s %10s %10s\n" "record2" "efgh" "5678"
	InsertLog "${test_file}" "${__header}" "%10s %10s %10s\n" "record3" "ijkl" "9101"
	cat ${test_file}
	rm -f ${test_file}
}
function test_logging(){
	Separator "logging"
	Info  "info  %s\n" 1
	Debug "debug %s\n" 2
	Warn  "warn  %s\n" 3
	Error "error %s\n" 4
}

function main(){
	test_i18n
	test_insert_log
	test_logging # alway put it at the end, for ERROR will exit
}

main
