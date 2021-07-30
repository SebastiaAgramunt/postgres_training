#!/bin/bash

brew_path=$(which brew)

if [[ -z $brew_path ]]
then
    echo "brew is not installed, installing it..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "brew is installed"
fi


psql_path=$(which psql)

if [[ -z $psql_path ]]
then
    echo "psql is not installed, installing it..."
    brew install postgresql
else
    echo "psql is installed"
fi
