#!/bin/bash

echo "=========================================="
echo "Installing Laravel dependencies ..."
composer install
composer dump-autoload
echo "------------------------------------------"
echo "Laravel dependencies installed!"
echo "=========================================="
sleep 3


# Install Bootstrap and jQuery
echo "=========================================="
echo "Installing Bootstrap and jQuery ..."
npm install
npm install bootstrap @popperjs/core jquery bootstrap-icons
npm install sass
echo "------------------------------------------"
echo "Bootstrap and jQuery installed!"
echo "=========================================="
sleep 3

# Copy .env.example
echo "=========================================="
echo "Copying .env.example ..."
cp .env.example .env
echo "------------------------------------------"
echo ".env created!"
echo "------------------------------------------"
echo "Generating key ..."
php artisan key:generate
echo "------------------------------------------"
echo "Key generated!"
echo "=========================================="
sleep 3

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
