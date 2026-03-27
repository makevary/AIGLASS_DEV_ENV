#!/bin/bash
#
# SET ANSI COLORS {{{ START
C_RED="[1;31m"
C_CYAN="[1;36m"
C_BLUE="[1;34m"
C_GREEN="[1;32m"
C_WHITE="[1;37m"
C_YELLOW="[1;33m"
C_MAGENTA="[1;35m"
C_NORMAL="[0;39m"
# SET ANSI COLORS END }}}


# $1 --> xml file
# $2 --> cache file
function_filter(){
	if [ ! -f ${1} ];then
		echo "Can not open file ${1} ..."
		exit 1
	fi
	awk '/name.*revision/' ${1} > ${2}
	sed -i "s/\(.*\)path=\"\([^\"]\{1,\}\)\"\(.*\)\(.*revision=\"\)\([0-9_a-z]\{40\}\)\(.*\)/\2 \5/" ${2}
	sed -i "s/\(.*\)name=\"\([^\"]\{1,\}\)\"\(.*\)\(.*revision=\"\)\([0-9_a-z]\{40\}\)\(.*\)/\2 \5/" ${2}
}


# $1 --> path
# $2 --> revision
# $3 --> check status
function_checkout_revision(){
	RET_SUCCESS="0"
	if [ -d ${1} ];then
		cd ${1}
		git checkout -- .
		if [ "$?" == ${RET_SUCCESS} ]; then
			git checkout ${2}
			if [ "$?" == ${RET_SUCCESS} ]; then
				echo "Checkout revision ${2} --> project ${C_GREEN}[SUCCESS]${C_NORMAL} ${1}"
				echo "Checkout revision ${2} --> project ${C_GREEN}[SUCCESS]${C_NORMAL} ${1}" >> $3
			else
				echo "Checkout revision ${2} --> project ${C_RED}[FAILURE]${C_NORMAL} ${1}"
				echo "Checkout revision ${2} --> project ${C_RED}[FAILURE]${C_NORMAL} ${1}" >> ${3}
			fi
		else
			echo "Checkout HEAD --> project ${1} ${C_RED}[FAILURE]${C_NORMAL}"
			kill -stop $$
		fi
		cd -
	else
		echo "${C_RED}Error project [${1}] NOT FOUND!!!${C_NORMAL}"
	fi
}

# $1 --> path
# $2 --> revision
# $3 --> dir name
function_checkout_patch_version2HEAD(){
	dist_dir=${3}/${1}
	commit_status=${3}/${1}/${File_Status_Name}
	project_flag="${Project_Flag} ${1}"
	mkdir -p ${dist_dir}
	if [ -d ${1} -a -d ${3} ];then
		echo "Check out ${1} pathes ${2}..HEAD"
		cd ${1} &&  echo ${project_flag} > ${commit_status} && git log --name-status --oneline ${2}..HEAD >> ${commit_status} && sed -i '/^[0-9_a-z]\{6,\} /d' ${commit_status} && git format-patch -s ${2} | xargs -I {} mv {} ${dist_dir}

		if [ `wc -l ${commit_status}  |awk '{print $1}'` -eq 1 ]; then
			rm -f ${commit_status}
		else
			echo >> ${commit_status}
		fi
		cd -
	else
		echo "${C_RED}Error patch [${1}]${C_NORMAL}"
	fi
}


# $1 --> path
# $2 --> revision 0
# $3 --> revision 1
# $4 --> dir name
function_checkout_patch_version2version(){
	dist_dir=${4}/${1}
	commit_status=${4}/${1}/${File_Status_Name}
	project_flag="${Project_Flag} ${1}"
	mkdir -p ${dist_dir}
	if [ -d ${1} ];then
		echo "Check out ${1} pathes ${2}..${3}"
		cd ${1} &&  echo ${project_flag} > ${commit_status} && git log --name-status --oneline ${2}..${3} >> ${commit_status} && sed -i '/^[0-9_a-z]\{6,\} /d' ${commit_status} && [[ "${DEBUG_FLAG}" != "true" ]] && git format-patch -s ${2}..${3} | xargs -I {} mv {} ${dist_dir}

		if [ `wc -l ${commit_status}  |awk '{print $1}'` -eq 1 ]; then
			rm -f ${commit_status}
		else
			if [ "${DEBUG_FLAG}" == "true" ];then
				echo "${2} .. ${3}" >> ${commit_status}
			fi
			echo >> ${commit_status}
		fi
		cd -
	else
		echo "${C_RED}Error project [${1}]${C_NORMAL}"
	fi
}

function_clean(){
	rm -f ${tmpfile_0}
	find ${PatchDir} -type f -empty -delete
	find ${PatchDir} -type d -empty -delete
}

do_chk_revision(){
	#--------------------------------------------------------------------------------
	if [ -f ${Checkout_Revision_Status} ]; then
		rm -fv ${Checkout_Revision_Status}
	fi
	while read path revision
	do
		echo "$revision <==> $path"
		function_checkout_revision ${path} ${revision} ${Checkout_Revision_Status}
	done < ${tmpfile_0}

	echo -e "\nTotal Project `wc -l ${Checkout_Revision_Status} | awk '{print $1}'`" >> ${Checkout_Revision_Status}
	#--------------------------------------------------------------------------------
}

do_chk_diff_revision2revision(){
	#--------------------------------------------------------------------------------
	# $1 --> diff xml
	function_filter ${1} ${tmpfile_1}

	paste -d " " ${tmpfile_0} ${tmpfile_1} > ${tmpfile_2}

	while read path0 revision0
	do
		while read path1 revision1
		do
			if [ "${path0}" = "${path1}" ];then
				function_checkout_patch_version2version ${path0} ${revision0} ${revision1} ${PatchDir}
				echo "${C_GREEN}${path0}<${revision0}>  MATCH  ${path1}<${revision1} ${C_NORMAL}"
				break
				# else
				# echo "${C_RED}${path0}<${revision0}>  NOT MATCH  ${path1}<${revision1} ${C_NORMAL}"
			fi
		done < $tmpfile_1
	done <  ${tmpfile_0}

	find ${PatchDir} -type f -name ${File_Status_Name} |xargs -I {} cat {} > ${PatchDir}/commit_lists

	rm -f ${tmpfile_1} ${tmpfile_2}

	#--------------------------------------------------------------------------------
}

do_chk_diff_revision2HEAD(){
	#--------------------------------------------------------------------------------
	while read path revision
	do
		echo "$revision <==> $path"
		function_checkout_patch_version2HEAD ${path} ${revision} ${PatchDir}
	done < ${tmpfile_0}
	find ${PatchDir} -type f -name ${File_Status_Name} |xargs -I {} cat {} > ${PatchDir}/commit_lists
	#--------------------------------------------------------------------------------
}

message_help(){
	echo "$1: ver v1"
	echo "    $1 test.xml        --> Check the The difference between test.xml and HEAD"
	echo "    $1 old.xml new.xml --> Check the The difference between old.xml and new.xml"
	echo "    $1 test.xml chk    --> Checkout the version of test.xml"
}
################################################################################
# DEBUG_FLAG=true
cwd=`pwd`
tmpfile_0=${cwd}/.${USER}_cache_file0
tmpfile_1=${cwd}/.${USER}_cache_file1
tmpfile_2=${cwd}/.${USER}_cache_file2
File_Status_Name=commit_status
Checkout_Revision_Status=${cwd}/chk_ver_status
PatchDir=${cwd}/format-patch-`date +%y%m%d-%H%M%S`
Project_Flag=PROJECT_FLAG

case $1 in
	*.xml)
		# $1 --> version xml
		function_filter ${1} ${tmpfile_0}
		;;
	*)
		message_help "`basename $0`"
		exit 0
		;;
esac

case $2 in
	chk)
		echo "==================== Checkout To Revision ======================"
		do_chk_revision
		;;

	*.xml)
		echo "==================== Checkout Diff Revision To Revision ======================"
		do_chk_diff_revision2revision ${2}
		function_clean
		tree ${PatchDir}
		echo "====================${PatchDir}======================="
		;;

	"")
		echo "==================== Checkout Diff HEAD ======================"
		do_chk_diff_revision2HEAD
		function_clean
		tree ${PatchDir}
		echo "====================${PatchDir}======================="
		;;

	*)
		;;
esac

