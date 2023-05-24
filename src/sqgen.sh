#!/bin/bash

# Output color.
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
white=$(tput setaf 7)
reset=$(tput sgr0)

usage() {
    cat <<EOF

${green}Welcome!${reset}

Usage: $0 [options] [--] [file...]

Arguments:

  -h, --help
    Display this usage message and exit.

  -h <command>, --help <command>
    Shows useful information about the given command.

EOF
}

generate_sql() {
    printf "${green}Welcome! Let's generate your SQL query...${reset}\n"

    read -p "Query type: " query_type
 
    read -p "Table name: " table_name

    read -p "Conditions (field, operator, comparison): " conditions

    printf "${yellow}Generating query...${reset}\n"

    printf "$query_type FROM $table_name WHERE $conditions\n"

    printf "${green}Done!${reset}\n"
}

for ARG in ${@}; do
    case "$ARG" in
    "generate")
        generate_sql
        ;;
    *)
        usage
        ;;
    esac
done

if [ $# -eq 0 ]; then
    usage
fi
