#!/bin/bash

set -e

echo "Cleaning..."
rm -f resume/info.tex resume/lang.tex ./*.aux ./*.log ./*.out

interactive=""

while getopts "i:v" flag; do
  case "${flag}" in
  i) interactive="true" ;;
  *) exit 1 ;;
  esac
done

PHONE="---"

if [ -n "$interactive" ]; then
  printf "Phone number? "
  read -r PHONE
fi

sed "s/\mobile{---}/\mobile{$PHONE}/" info >resume/info.tex

build() {
  language=$1
  cp "lang_$language" resume/lang.tex

  echo "Building $language..."

  for f in *.tex; do xelatex "$f"; done

  mv resume.pdf "example_$language.pdf"
}

build en
build fr
