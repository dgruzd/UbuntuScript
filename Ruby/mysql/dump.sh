#!/bin/bash
USER="root"
PASSWORD=""
DB_NAME="russian_reading_list_development"
OUTPUT="mysql-`date \+\%Y_\%m_\%d_\%s`-$DB_NAME.sql"


mysqldump -u$USER -p$PASSWORD --opt $DB_NAME > $OUTPUT
