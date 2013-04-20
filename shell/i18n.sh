#!/bin/sh
#	author: Kimi Cao
#	for I18N usage
#
#	example: 
#		I18N_LANG="zh_CN"
#		I18N_PROJ=("project" "项目")
#		I18n I18N_PROJ

I18N_INDEX=
I18N_LANGUAGES=("en_US" "zh_CN")
I18N_OK=false

for(( i = 0; i < ${#I18N_LANGUAGES[@]}; i++ )){
	if [ "${I18N_LANG}" == ${I18N_LANGUAGES[i]} ];then
		I18N_INDEX=${i}
		break
	fi
}
if [ ! "${I18N_INDEX}" == "" ];then
	I18N_OK=true
fi

function I18n(){
	if ! ${I18N_OK};then
		ERROR "i18n invalid, check I18N_LANG\n"
	fi
	__i18n_cmd_string="echo \${$1[${I18N_INDEX}]}"
	eval ${__i18n_cmd_string}
}
