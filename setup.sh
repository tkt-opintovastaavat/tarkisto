#!/bin/bash

echo "Setting enviroment"
export NLS_LANG=AMERICAN_AMERICA.UTF8 >> /dev/null

echo "Copying database"
cp config/database.yml.example config/database.yml >> /dev/null
cp config/ldap.yml.example config/ldap.yml >> /dev/null
echo "Setting up database"
rake db:drop # >> /dev/null
rake db:drop RAILS_ENV=test # >> /dev/null
rake db:migrate # >> /dev/null
rake db:setup # >> /dev/null
rake db:setup RAILS_ENV=test # >> /dev/null
rake db:setup RAILS_ENV=production # >> /dev/null
echo "Done!"
