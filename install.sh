#!/usr/bin/env bash

__script_path="$(realpath $0)"
__script_path="${__script_path%/*}"

__profile_path="$1"

if [[ -z ${__profile_path} ]]; then
    printf "You need to specify your profile path!\n" 1>&2
    exit 1
fi

# Link chrome folder

if [[ -d ${__profile_path}/chrome ]]; then
    printf 'Moving "<profile>/chrome/" -> "<profile>/chrome.old/"\n' 1>&2
    mv -f ${__profile_path}/chrome ${__profile_path}/chrome.old
fi

printf 'Linking "<repo>/chrome/" -> "<profile>/chrome/"\n' 1>&2
ln -s ${__script_path}/chrome ${__profile_path}/chrome

# Link user.js

if [[ -e ${__profile_path}/user.js ]]; then
    printf 'Moving "<profile>/user.js" -> "<profile>/user.js.old/"\n' 1>&2
    mv -f ${__profile_path}/user.js ${__profile_path}/user.js.old
fi

printf 'Linking "<repo>/user.js" -> "<profile>/user.js"\n' 1>&2
ln -s ${__script_path}/user.js ${__profile_path}/user.js
