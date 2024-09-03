#!/bin/bash

echo "=========================================="
echo "Installing Laravel dependencies ..."
composer install
composer dump-autoload
echo "------------------------------------------"
echo "Laravel dependencies installed!"
sleep 3
echo "=========================================="


# Install Bootstrap and jQuery
echo "=========================================="
echo "Installing Bootstrap and jQuery ..."
npm install
npm install bootstrap @popperjs/core jquery bootstrap-icons
npm install sass
echo "------------------------------------------"
echo "Bootstrap and jQuery installed!"
sleep 3
echo "=========================================="

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
