#!/bin/bash
host="${@: -2: 1}"
cmd="${@: -1: 1}"

declare -a opts
for ssh_arg in "${@: 1: $# -3}" ; do
        if [[ "${ssh_arg}" == --* ]] ; then
                opts+="${ssh_arg} "
        fi
done

exec gcloud compute ssh "${host}" $opts -- -C "${cmd}"
