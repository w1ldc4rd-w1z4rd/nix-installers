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
# Irssi Debian 12 Installer
#
# By: w1ldc4rd_w1z4rd (2024-06-12)
#
# Run: curl -sSL https://irc.clc.onl | bash
#
# ~~~~~~~~~~~~~~~~ DEPENDENCIES

sudo apt update -y
sudo apt upgrade -y
sudo apt install perl -y
sudo apt install cpanminus -y

# ~~~~~~~~~~~~~~~~ HEREDOCS

read -r -d '' CMDS <<'CMDS'
sudo apt install irssi -y
irssi -c '/quit'
CMDS

read -r -d '' CFG <<'CFG'
{
    address = "clc.onl";
    chatnet = "clc";
    port = "6969";
    use_ssl = "yes";
    ssl_verify = "no";
    autoconnect = "yes";
},
CFG

# ~~~~~~~~~~~~~~~~ FUNCTIONS

check_fail() 
{
  if [ $? -ne 0 ]; then
    # Bold text
    BOLD=$(tput bold)
    # Normal text
    NORMAL=$(tput sgr0)
    echo -e "${BOLD}Failed: ${BASH_COMMAND}${NORMAL}"
    exit 1
  fi
}

# ~~~~~~~~~~~~~~~~ INIT

echo $CMDS | perl -Mfeature=try -MTerm::ANSIColor=':constants' -snlE '

    no warnings q|experimental|;

    map
    {
        say BOLD GREEN qq|> $_|, RESET;

        eval { system $_ };
        
	unless ($? == 0)
	{
            die BOLD RED qq|> Fail: $e\n|, RESET;
        }

    } split ( qr|\n|, $cmds )

' 

check_fail

sudo apt autoremove -y

perl -i.$(date +%s).bak -psle '
    
    s~servers = \(~qq|${&}\n${cfg}|~e
    
' -- -cfg="$CFG" $HOME/.irssi/config

check_fail

perl -MTerm::ANSIColor=:constants -sE '
    
    say q|To Launch App:|;
    say YELLOW BOLD $cmd, RESET; 
    
' -- -cmd="irssi -c clc.onl -p 6969 -n $USER"


# ~~~~~~~~~~~~~~~~ END

