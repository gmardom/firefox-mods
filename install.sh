#!/bin/sh

__script_path="$(realpath $0)"
__script_path="${__script_path%/*}"

echo $__script_path
exit 0

__profile_path="$1"

if [[ -z ${__profile_path} ]]; then
    printf "You need to specify your profile path!\n" 1>&2
    exit 1
fi


# Link chrome folder

if [[ -d ${__profile_path}/chrome ]]; then
    printf 'Moving "<profile>/chrome/" -> "<profile>/chrome.old/"'
    mv -f ${__profile_path}/chrome ${__profile_path}/chrome.old
fi
