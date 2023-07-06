#!/bin/bash


# xorg display server installation
sudo apt install -y xserver-xorg xinit

# INCLUDES make,etc.
sudo apt install -y python3-pip 

# Qtile requirements
sudo apt install -y libpangocairo-1.0-0
sudo apt install -y python3-xcffib python3-cairocffi

# Install qtile
pip3 install qtile