#!/bin/sh
#	author: Kimi Cao
#	configure file
#	included other config here

BASE_DIR="/root/base_lib/bash"
NOW=`date +%F_%H-%M-%S`

#----- logging -----
DEBUG_FLAG=true
LOGGING_FILE=
source ${BASE_DIR}/logging.sh

#----- i18n -----
I18N_LANG="en_US"   # en_US zh_CN
I18N_LANG="zh_CN"   # en_US zh_CN
source ${BASE_DIR}/i18n.sh

#----- utils -----
source ${BASE_DIR}/utils.sh


