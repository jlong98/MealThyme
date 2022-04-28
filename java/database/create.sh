#!/bin/bash
SET client_encoding TO 'UTF8';
export PGPASSWORD='postgres'
BASEDIR=$(dirname $0)
DATABASE=final_capstone
psql -U postgres -f "$BASEDIR/dropdb.sql" &&
createdb -U postgres $DATABASE &&
psql -U postgres -d $DATABASE -f "$BASEDIR/schema.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/tables.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/user.sql"

