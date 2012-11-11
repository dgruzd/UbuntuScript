#!/bin/sh
DUMP_PATH="$HOME/Backup"
USER="booqpro"
PASSWORD="boopro"
DB_NAME="booqpro_production"

OUTPUT="$DUMP_PATH/$DB_NAME-`date \+\%Y_\%m_\%d_\%s`.sql"
sudo -u postgres pg_dump -U postgres $DB_NAME > $OUTPUT
7z a $OUTPUT.7z $OUTPUT
rm $OUTPUT
