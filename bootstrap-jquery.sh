#!/bin/bash

# Remove the git origin
echo "Removing the git origin ..."
rm -rf .git
clear

echo "Git origin removed!!"
sleep 3
clear

# Change directory to setup the name
cd ..

# Asks the project name
echo "What is the name of your project?"
read project_name
clear

# Rename the project's directory
echo "Changing the directory's name to: $project_name"
mv LaravelTemplate "$project_name"
sleep 2
clear
echo "Directory's name changed to: $project_name!!"
sleep 3

# Enters the project's directory
cd "$project_name"

# Install Laravel dependencies
echo "Installing Laravel dependencies ..."
composer install
composer dump-autoload
clear
echo "Laravel dependencies installed!"
sleep 3
clear

# Install Bootstrap and jQuery
echo "Installing Bootstrap and jQuery ..."
npm install
npm install bootstrap @popperjs/core jquery bootstrap-icons
npm install sass
clear
echo "Bootstrap and jQuery installed!"
sleep 3
clear

echo "Your project $project_name is ready for development!"
sleep 2
clear
echo "Paste @include('imports.bootstrap-jquery') inside your head's blade!"
echo "Bye!"
