#!/bin/bash

set -e

echo "Cleaning..."
rm -f ./*.aux ./*.log ./*.out

interactive=""

while getopts "i" flag; do
  case "${flag}" in
  i) interactive="true" ;;
  *) exit 1 ;;
  esac
done

echo adsf

PHONE="---"

if [ -n "$interactive" ]; then
  printf "Phone number? "
  read -r PHONE
fi

echo $PHONE

build() {
  language=$1
  if [ $language = "en" ]; then
    lang_cmd="\newcommand{\lang}[2]{#1}"
  else
    lang_cmd="\newcommand{\lang}[2]{#2}"
  fi

  echo "Building $language..."

  pdflatex "${lang_cmd}\def\phone{${PHONE}}\input resume.tex"

  mv resume.pdf "example_$language.pdf"
}

build en
build fr
