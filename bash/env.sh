
# call with one argument, script will return value of environment variable from .env under ${1} name variable
# /bin/bash bash/env.sh ../.env PROTECTED_MYSQL_HOST


_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P )"

source "${_DIR}/colours.sh";

if [ ${#} -lt 2 ]; then

    echo "bash/env.sh: not enough arguments given";

    exit 1
fi

if [ ! -e "${1}" ]; then  # not exist (fnode, directory, socket, etc.)

    # https://stackoverflow.com/a/23622446
    { red ".env file ${1} file doesn't exist"; } 2>&3

    exit 1;
fi

source "${1}";

# better way of extracting than using eval:
# indirect expansion
# https://stackoverflow.com/a/8515492
# https://ss64.com/bash/syntax-expand.html
# g(Shell Parameter Expansion ${ })

# buuuuuu it' doesn't work with zsh :(, revert to eval ...

#echo -n "${!2}"

echo "$(eval echo "\$${2}")"
