
# hobomigra punta a :  ruby script/generate hobo_migration
rm db/development.sqlite3 ; hobomigra ; rake db:migrate ; rake db:seed

