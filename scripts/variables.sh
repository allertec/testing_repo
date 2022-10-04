#!/bin/bash
ACCOUNT_NAME="$1"
set -x

# Enhanced print function
pretty_print(){
    len=${#1}
    line_separator=$(printf "%-${len}s" ' ')
    echo
    echo "${line_separator// /-}"
    printf "$1\n"
    echo "${line_separator// /-}"
    echo
}

function setup_aws_env {
    if [[ ${ACCOUNT_NAME} == 'accountA' ]]; then
        echo "REGION=eu-west-1" >> $GITHUB_ENV
    elif [[ ${ACCOUNT_NAME} == 'accountB' ]]; then
        echo "REGION=us-west-2" >> $GITHUB_ENV
    elif [[ ${ACCOUNT_NAME} == 'accountC' ]]; then
        echo "REGION=us-east-1" >> $GITHUB_ENV
    else
        echo "You have provided incorrect AWS Account"
        exit 1
    fi
}

