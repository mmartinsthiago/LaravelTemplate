#!/bin/bash

clear
echo "=================================================="
echo "=================================================="
echo "=================================================="
echo "=================================================="
echo "Welcome to Laravel, Bootstrap and JQuery template!"
echo "\n"
sleep 3
echo "Here will be installed the Laravel and npm dependecies:"
sleep 1
echo "1) Laravel and laravelcollective/html;"
sleep 1
echo "2) npm dependencies, bootstrap, @popperjs/core, bootstrap icons and jquery;"
sleep 1
echo "3) copy the '.env.example' to '.env';"
sleep 1
echo "4) generate the artisan key."
sleep 1
echo "The instalation will begin in 3 seconds:"
echo "=================================================="
echo "=================================================="
echo "=================================================="
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
clear

# Laravel dependecies
composer install
composer dump-autoload

# Install Bootstrap and jQuery
npm install
npm install bootstrap @popperjs/core jquery bootstrap-icons
npm install sass

# Copy .env.example
cp -f .env.example .env

# Generate artisan key
php artisan key:generate

clear
echo "=========================================="
echo "Your project is ready for development!"
sleep 2
echo "====================================================================="
echo "====================================================================="
echo "====================================================================="
echo "Paste @include('imports.bootstrap-jquery') inside your head's blade!"
echo "====================================================================="
echo "====================================================================="
echo "====================================================================="
echo "Bye!"
