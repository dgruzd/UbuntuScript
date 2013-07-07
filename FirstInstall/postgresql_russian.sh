#!/bin/sh
DIR=/usr/share/postgresql/9.1/tsearch_data/

sudo apt-get --assume-yes install wget unzip iconv

cd /tmp
wget http://ftp5.gwdg.de/pub/openoffice/contrib/dictionaries/ru_RU-pack.zip

unzip ru_RU-pack.zip
unzip ru_RU.zip

iconv -f koi8-r -t utf-8 < ru_RU.aff > russian.affix
iconv -f koi8-r -t utf-8 < ru_RU.dic > russian.dict

sudo mv russian.affix $DIR
sudo mv russian.dict $DIR


echo "CREATE TEXT SEARCH DICTIONARY russian_ispell ( TEMPLATE = ispell, DictFile = russian, AffFile = russian, StopWords = russian);" | sudo -u postgres psql
echo "CREATE TEXT SEARCH CONFIGURATION russian (COPY=russian);" | sudo -u postgres psql
echo "ALTER TEXT SEARCH CONFIGURATION russian ALTER MAPPING FOR hword, hword_part, word WITH russian_ispell, russian_stem;" | sudo -u postgres psql

echo "select to_tsvector('russian', 'мама мыла раму');" | sudo -u postgres psql
