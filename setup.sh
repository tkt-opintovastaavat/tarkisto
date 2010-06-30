#!/bin/bash

echo "Copying database"
cp config/database.yml.example config/database.yml >> /dev/null
echo "Setting up database"
rake db:drop # >> /dev/null
rake db:drop RAILS_ENV=test # >> /dev/null
rake db:migrate # >> /dev/null
rake db:setup # >> /dev/null
rake db:setup RAILS_ENV=test # >> /dev/null
echo "Done!"
