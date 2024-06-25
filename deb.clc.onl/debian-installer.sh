#!/bin/bash
#
# .--.
# |__| .-------.
# |=.| |.-----.|
# |--| || CLC ||
# |  | |'-----'|
# |__|~')_____('
#
# Command Line Collective
# https://clc.onl
#
# Debian Setup
#
# By: w1ldc4rd_w1z4rd (2024-06-14)
#
# Run: curl -sSL https://deb.clc.onl | bash
#
# ~~~~~~~~~~~~~~~~ FUNCTIONS

check_fail() 
{
  if [ $? -ne 0 ]; then
    # Bold text
    BOLD=$(tput bold)
    # Red text
    RED=$(tput setaf 1)
    # Normal text
    NORMAL=$(tput sgr0)
    echo -e "> ${BOLD}${RED}Failed: ${BASH_COMMAND}${NORMAL}"
    exit 1
  fi
}

# ~~~~~~~~~~~~~~~~ SUDO

echo $USER | perl -nle 'print qq~${_} ALL=(ALL) NOPASSWD:ALL~' | sudo tee -a /etc/sudoers >/dev/null

check_fail

# ~~~~~~~~~~~~~~~~ DEPENDENCIES

sudo apt update -y
sudo apt upgrade -y
sudo apt install perl -y
sudo apt install cpanminus -y

# ~~~~~~~~~~~~~~~~ DIRS

mkdir -p $HOME/temp
mkdir -p $HOME/git
mkdir -p $HOME/code

# ~~~~~~~~~~~~~~~~ HEREDOCS

read -r -d '' CMDS <<'CMDS'
# Debian Basics Installer
sudo apt install -y build-essential
sudo apt install -y make
sudo apt install -y neofetch
sudo apt install -y ufw
sudo apt install -y vim
sudo apt install -y git
sudo apt install -y rsync
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y ack-grep
sudo apt install -y gpm
sudo apt install -y pcregrep
sudo apt install -y lynx
sudo apt install -y htop
sudo apt install -y ssh
sudo apt install -y net-tools
sudo apt install -y ifupdown
sudo apt install -y unzip
sudo apt install -y screen
sudo apt install -y tmux

# Debian Extras Installer
# sudo apt install -y youtube-dl
sudo apt install -y xdotool
sudo apt install -y minimodem
sudo apt install -y zbar-tools
sudo apt install -y qrencode
sudo apt install -y sox
sudo apt install -y ffmpeg
sudo apt install -y imagemagick
sudo apt install -y zenity
sudo apt install -y dialog
sudo apt install -y expect
sudo apt install -y yad
sudo apt install -y mc
sudo apt install -y ranger
# sudo apt install -y thermald
sudo apt install -y genisoimage
sudo apt install -y pcregrep

# Debian GUI software
sudo apt install -y kate
sudo apt install -y psensor

# Perl Installer
sudo cpanm Tcl
sudo cpanm HTTP::Request::Common
sudo cpanm LWP::UserAgent
sudo cpanm JSON::XS
sudo cpanm Regexp::Grammars
sudo cpanm Data::Dump
sudo cpanm Mojo::Util
sudo cpanm Mojolicious::Lite
sudo cpanm Mojo::UserAgent
sudo cpanm IO::All
sudo cpanm Net::SMTP
sudo cpanm Time::Piece
sudo cpanm Spreadsheet::ParseXLSX

# Install Raku (Rakudo)
sudo apt install -y rakudo

# Install zef
sudo apt install -y raku-zef

# Install Raku modules
sudo apt install -y raku-file-find
sudo apt install -y raku-getopt-long
sudo apt install -y raku-json-fast
sudo apt install -y raku-log

# Install PCRE (Perl Compatible Regular Expressions) library
sudo apt-get install libpcre3 libpcre3-dev -y

# S-Lang library and interpreter
sudo apt install -y slang-slsh

# Install the core S-Lang package
sudo apt install -y slang

# Install development files for S-Lang
sudo apt install -y libslang2-dev

# Install PCRE libraries and development files
sudo apt install -y libpcre3
sudo apt install -y libpcre3-dev

# Install GTK3 bindings for S-Lang
sudo apt install -y slgtk3

# Install GTK3 development files
sudo apt install -y libgtk-3-dev

# Install additional utilities and documentation for S-Lang
sudo apt install -y slsh-doc slsh-dev

# Install JED, a text editor that uses the S-Lang library
sudo apt install -y jed

# TCL Install

# Update the package list
sudo apt update

# Install the TCL interpreter and core packages
sudo apt install -y tcl

# Install TCL development files
sudo apt install -y tcl-dev

# Install Expect (a tool for automating interactive applications)
sudo apt install -y expect

# Install TCLlib (a collection of utility modules for TCL)
sudo apt install -y tcllib

# Install TK (a toolkit for creating graphical user interfaces with TCL)
sudo apt install -y tk

# Install TK development files
sudo apt install -y tk-dev

# Install SQLite3 TCL bindings (for database operations)
sudo apt install -y tcl-sqlite3

# Install TCLX (Extended TCL, adds new commands and capabilities)
sudo apt install -y tclx

# Install TCL Thread (for multi-threading support)
sudo apt install -y tcl-thread

# Install TCLlibc (a collection of C-based extensions for TCL)
sudo apt install -y tcllibc

# Install TCLTLS (for TLS/SSL support)
sudo apt install -y tcl-tls

# Install TCL PCRE bindings
sudo apt install -y tcl-pcre

# Install Icon compiler
sudo apt install -y iconc

# Ruby Installer
sudo apt install -y ruby
sudo gem install colorize
sudo gem install capybara
sudo gem install selenium-webdriver

# Append lines to .bashrc individually
echo "######## Customized .bashrc Config" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Set vi mode for command line editing
echo "# Set vi mode for command line editing" | tee -a $HOME/.bashrc >/dev/null
echo "set -o vi" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Export Environment Variables
echo "# Export Environment Variables" | tee -a $HOME/.bashrc >/dev/null
echo "# Set default editor as Vim" | tee -a $HOME/.bashrc >/dev/null
echo "export VISUAL=/usr/bin/vim" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Customize the command prompt
echo "# Customize the command prompt" | tee -a $HOME/.bashrc >/dev/null
echo "export PS1='\\\\w> '" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Add custom path to PATH
echo "# Add custom path to PATH" | tee -a $HOME/.bashrc >/dev/null
echo "export PATH=\$HOME/code:\$PATH" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias Commands
echo "# Alias Commands" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias for clearing the screen
echo "# Alias for clearing the screen" | tee -a $HOME/.bashrc >/dev/null
echo "alias c='clear'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias for listing files in long format with human-readable sizes
echo "# Alias for listing files in long format with human-readable sizes" | tee -a $HOME/.bashrc >/dev/null
echo "alias l='clear && ls -lha'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias to edit and reload .bashrc
echo "# Alias to edit and reload .bashrc" | tee -a $HOME/.bashrc >/dev/null
echo "alias bed='vi \${HOME}/.bashrc && source \${HOME}/.bashrc && clear'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias to view command history
echo "# Alias to view command history" | tee -a $HOME/.bashrc >/dev/null
echo "alias h='history'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias to edit Apache config and restart Apache server
echo "# Alias to edit Apache config and restart Apache server" | tee -a $HOME/.bashrc >/dev/null
echo "alias web='sudo vi /etc/apache2/sites-available/web.conf && sudo service apache2 restart'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias to change directory to /var/www/
echo "# Alias to change directory to /var/www/" | tee -a $HOME/.bashrc >/dev/null
echo "alias www='cd /var/www/'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias for updating and upgrading the system
echo "# Alias for updating and upgrading the system" | tee -a $HOME/.bashrc >/dev/null
echo "alias up='sudo apt update -y && sudo apt upgrade -y'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias for setting up SSL with certbot and restarting Apache
echo "# Alias for setting up SSL with certbot and restarting Apache" | tee -a $HOME/.bashrc >/dev/null
echo "alias ssl='sudo certbot --apache && sudo service apache2 restart'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias to check SSH login attempts, remote logins, and active sessions in a single line
echo "# Alias to check SSH login attempts, remote logins, and active sessions in a single line" | tee -a $HOME/.bashrc >/dev/null
echo "alias w='clear && sudo fail2ban-client status sshd | grep -v Banned && printf \"*** REMOTE LOGINS ***\\n\" && lastlog | grep -v \"***Never\" && printf \"*** STILL LOGGED IN ***\\n\" && last | grep -i still'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Alias for copying files with rsync
echo "# Alias for copying files with rsync" | tee -a $HOME/.bashrc >/dev/null
echo "alias cpr='rsync --archive --verbose --update --progress'" | tee -a $HOME/.bashrc >/dev/null
echo "" | tee -a $HOME/.bashrc >/dev/null

# Adding useful defaults to .vimrc
echo "set number" | tee -a $HOME/.vimrc >/dev/null
echo "syntax on" | tee -a $HOME/.vimrc >/dev/null
echo "set showcmd" | tee -a $HOME/.vimrc >/dev/null
echo "set cursorline" | tee -a $HOME/.vimrc >/dev/null
echo "set wildmenu" | tee -a $HOME/.vimrc >/dev/null
echo "set expandtab" | tee -a $HOME/.vimrc >/dev/null
echo "set tabstop=4" | tee -a $HOME/.vimrc >/dev/null
echo "set shiftwidth=4" | tee -a $HOME/.vimrc >/dev/null
echo "set autoindent" | tee -a $HOME/.vimrc >/dev/null
echo "set smartindent" | tee -a $HOME/.vimrc >/dev/null
echo "set background=dark" | tee -a $HOME/.vimrc >/dev/null
echo "set incsearch" | tee -a $HOME/.vimrc >/dev/null
echo "set hlsearch" | tee -a $HOME/.vimrc >/dev/null
echo "set ignorecase" | tee -a $HOME/.vimrc >/dev/null
echo "set smartcase" | tee -a $HOME/.vimrc >/dev/null
echo "set clipboard=unnamedplus" | tee -a $HOME/.vimrc >/dev/null
echo "set splitright" | tee -a $HOME/.vimrc >/dev/null
echo "set splitbelow" | tee -a $HOME/.vimrc >/dev/null
echo "set mouse=a" | tee -a $HOME/.vimrc >/dev/null
echo "set backupdir=$HOME/.vim/tmp,." | tee -a $HOME/.vimrc >/dev/null
echo "set directory=$HOME/.vim/tmp,." | tee -a $HOME/.vimrc >/dev/null
echo "set undodir=$HOME/.vim/tmp,." | tee -a $HOME/.vimrc >/dev/null
echo "set undofile" | tee -a $HOME/.vimrc >/dev/null
echo "set hidden" | tee -a $HOME/.vimrc >/dev/null
echo "set ruler" | tee -a $HOME/.vimrc >/dev/null
echo "set relativenumber" | tee -a $HOME/.vimrc >/dev/null
echo "set laststatus=2" | tee -a $HOME/.vimrc >/dev/null
echo "set statusline=%f%m%r%h%w[%{&ff},%Y][%l/%L,%c][%p%%]" | tee -a $HOME/.vimrc >/dev/null
echo "filetype plugin on" | tee -a $HOME/.vimrc >/dev/null
echo "filetype indent on" | tee -a $HOME/.vimrc >/dev/null

# Create necessary directories for backup, swap, and undo files
mkdir -p $HOME/.vim/tmp

echo "Vim configuration has been updated successfully."

# UFW Configuration for Web Servers
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
yes | sudo ufw enable
sudo ufw status verbose
CMDS

# ~~~~~~~~~~~~~~~~ INIT

echo $CMDS | perl -Mfeature=try -MTerm::ANSIColor=':constants' -snlE '

    no warnings q|experimental|;

    map
    {
	chomp;

        unless ( m~^$|^\#~ )
	{
		try
		{
			say BOLD GREEN qq|> $_|, RESET;
			system $_;    
		}
		catch ($e)
		{
			die BOLD RED qq|> Fail: $e\n|, RESET;
		}
	}
    } split ( qr|\n|, $cmds )

' -- -cmds="$CMDS"

check_fail

sudo apt autoremove -y

echo "Enable .bashrc changes:"
echo "source $HOME/.bashrc"
echo "Ruby Capybara Needs GeckoDriver from: https://github.com/mozilla/geckodriver/releases"

# ~~~~~~~~~~~~~~~~ END
