#!/usr/bin/env bash
#
# Simple bootstrapping program for the phonect-workflow project.
# Should work on Darwin, Debian and cygwin
set -o errtrace
set -o errexit
set -o pipefail

# Text color variables
declare -r txtund=$(tput sgr 0 1)          # Underline
declare -r txtbld=$(tput bold)             # Bold
declare -r bldred=${txtbld}$(tput setaf 1) #  red
declare -r bldyellow=${txtbld}$(tput setaf 3) #  yellow
declare -r bldgreen=$(tput setaf 2) #  green
declare -r bldpurp=${txtbld}$(tput setaf 5) #  purple
declare -r bldblu=${txtbld}$(tput setaf 4) #  blue
declare -r bldwht=${txtbld}$(tput setaf 7) #  white
declare -r txtrst=$(tput sgr0)             # Reset
# make sure we don't leave the terminal with some strange color
trap "printf '%b${txtrst}'" EXIT;

function say () {
    printf "\n${bldwht}%b${txtrst}\n" "$*";
}

function brag () {
    printf "\n${bldpurp}%b${txtrst}\n" "$*";
}

function warn () {
    printf "\n${bldyellow}WARN: %b${txtrst}\n" "$*";
}

function error () {
    printf "\n${bldred}ERROR: %b${txtrst}\n" "$*";
}

function fail () {
    printf "\n${bldred}FATAL ERROR: %b${txtrst}\n" "$*";
    exit 1;
}

function info () {
    printf "\n${bldgreen}%b${txtrst}\n" "$*";
}

say "Setting up node";

nvm version &>/dev/null || fail 'nvm has not been installed. Please install nvm and run this script again.';
test=$(node --version);echo $test | grep 'v5.5.0' || (info "Installing node v5.5" && nvm install 5.5 && nvm use 5.5 || fail "failed to install node v5.5");


brag "Successfully installed vagrant.domin.com"
