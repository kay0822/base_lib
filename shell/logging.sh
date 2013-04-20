#!/bin/sh
#	author: Kimi Cao
#	for logging projects
#
ECHO_COLOR="\033[0m"
ECHO_COLOR_DEFAULT="\033[0m"

function Logging(){
    echo -en "${ECHO_COLOR}$1${ECHO_COLOR_DEFAULT}"
    shift 1
    printf "$@"
}
function Info(){
    ECHO_COLOR="\033[32m"
    Logging "INFO:  "  "$@"
}
function Warn(){
    ECHO_COLOR="\033[33m"
    Logging "WARN:  "  "$@"
}
function Debug(){
    if ${DEBUG_FLAG}; then
        ECHO_COLOR="\033[34m"
        Logging "DEBUG: "  "$@"
    fi
}
function Error(){
    ECHO_COLOR="\033[31m"
    Logging "ERROR: "  "$@"
    exit 1
}


COUNT_FILE="${BASE_DIR}/.count"
function AutoIncrease(){
	__t_count=$(( `cat ${COUNT_FILE}` + 1 ))
	echo ${__t_count} > ${COUNT_FILE}
	cat ${COUNT_FILE}
}

# InsertLog($1, $2, ...)
#	$1: 	__logfile
#	$2: 	__header(title), a cmdline used to print title
#	...:	printf format
#		example: 
#			InsertLog "/tmp/testlog" 'printf "date  name   md5" "%5s %-20s %s"' "${date}" "${name}" "${md5}"
#
function InsertLog(){
	__tmp_file="/tmp/insertLog.$$"
	__logfile=$1
	__header=$2
	shift 2
	if ! [[ "${__logfile}" =~ ^/ ]];then
		ERROR "insertLog -> %s, please use absolute path instead\n" "${__logfile}"
	fi
	if [ ! -f "${__logfile}" ];then
		mkdir -p `dirname ${__logfile}`
		echo > ${__logfile}
	fi
	cat ${__logfile} |sed '1d'  	>  ${__tmp_file}
	eval ${__header}		>  ${__logfile}
	printf "$@"				>> ${__logfile}
	cat  ${__tmp_file} 		>> ${__logfile}

	rm -f ${__tmp_file}
}



