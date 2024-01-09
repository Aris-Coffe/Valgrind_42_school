#!/bin/bash

# Remove existing brew installation
rm -rf $HOME/.brew

# Clone brew from GitHub
git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew

# Add brew to PATH
echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc

# Source .zshrc to update PATH
source $HOME/.zshrc

# Update brew
brew update

# Check if brew installation was successful
if [ $? -eq 0 ]; then
    echo "Brew installed successfully."
else
    echo "Brew installation failed."
    exit 1
fi

# Install Valgrind:
brew tap LouisBrunner/valgrind
brew install --HEAD LouisBrunner/valgrind/valgrind

# Check if Valgrind installation was successful
if [ $? -eq 0 ]; then
    echo "Valgrind installed successfully."
else
    echo "Valgrind installation failed."
    exit 1
fi

# Upgrade Valgrind:
brew upgrade --fetch-HEAD LouisBrunner/valgrind/valgrind

# Check if Valgrind upgrade was successful
if [ $? -eq 0 ]; then
    echo "Valgrind upgraded successfully."
else
    echo "Valgrind upgrade failed."
    exit 1
fi

# Print usage information
echo "Run:"
echo "Compiler flags needed:"
echo "-Wall -Werror -Wextra -g"
echo "valgrind --leak-check=full ./a.out"
echo "Possible to give arguments after ./a.out like this!"
echo "valgrind --leak-check=full ./a.out 1 2 3 \"1 2 3\""
echo "----------------------------------------------------------"
echo -e "\e[31mWARNING: If error like this:"
echo "error: Invalid usage: --HEAD is not supported with HOMEBREW_NO_INSTALL_FROM_API unset! To resolve please run:"
echo "  export HOMEBREW_NO_INSTALL_FROM_API=1"
echo "  brew tap Homebrew/core"
echo "and retry this command."
echo "YOU CANNOT INSTALL THIS VALGRIND VERSION ON YOUR PC... SORRY!\e[0m"