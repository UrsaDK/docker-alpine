# Setup a red prompt for root and a green one for users.
# rename this file to color_prompt.sh to actually enable it

NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"

if [ "$(whoami)" = "root" ]; then
	PS1="$RED\u@\h$NORMAL:\w # "
else
	PS1="$GREEN\u@\h$NORMAL:\w \$ "
fi
