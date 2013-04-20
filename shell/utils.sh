#!/bin/sh
#	author: Kimi Cao
#	utils
#

#----- separator -----
SEPARATOR_SYMBOL="-"
SEPARATOR_LENGTH=50
function LoopSymbols(){
	__ret=
	for((i=0; i<$1; i++)){
		__ret="${__ret}${SEPARATOR_SYMBOL}"
	}
	echo ${__ret}
}
function Separator(){
	__text_length=${#1}
	if [ $(( ${__text_length} % 2 )) -eq 0 ];then
		__text="$1"
	else
		__text_length=$(( ${__text_length} + 1 ))
		__text="$1 "
	fi
	__padding_num=$(( (${SEPARATOR_LENGTH} - 2 - ${__text_length}) / 2 ))
	__padding=`LoopSymbols ${__padding_num}`
	echo "${__padding} ${__text} ${__padding}"
}


#----- copy -----
COPY_COUNT=0
function DoCopy(){
	__src=$1
	__dst=$2
	cp -af ${__src} ${__dst}
	COPY_COUNT=$(( ${COPY_COUNT}+1 ))
	if ${DEBUG_FLAG};then
		Debug "%06d %s\n>>>>>> %s\n"  ${COPY_COUNT}  ${__src}  ${__dst}
	fi
}

