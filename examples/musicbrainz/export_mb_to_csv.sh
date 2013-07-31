#!/bin/sh
SQL_FILES=~/code/sql2graph/examples/musicbrainz/sql/*
DUMP_DIR=/tmp/dumps/csv_files
MBSLAVE_DIR=~/code/mbslave
for f in $SQL_FILES
do
  cd $MBSLAVE_DIR
  filename="${f##*/}"
  dumpfile=$DUMP_DIR/$filename.cvs
  echo exporting $filename to $dumpfile
  cat $f | ./mbslave-psql.py > $dumpfile
done
