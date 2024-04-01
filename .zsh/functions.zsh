spectrum() {
    echo "${fg[black]}BLACK${reset_color}               PR_BLACK"
    echo "${fg[red]}RED${reset_color}                   PR_RED"
    echo "${fg[green]}GREEN${reset_color}               PR_GREEN"
    echo "${fg[yellow]}YELLOW${reset_color}             PR_YELLOW"
    echo "${fg[blue]}BLUE${reset_color}                 PR_BLUE"
    echo "${fg[magenta]}MAGENTA${reset_color}           PR_MAGENTA"
    echo "${fg[cyan]}CYAN${reset_color}                 PR_CYAN"
    echo "${fg[white]}WHITE${reset_color}               PR_WHITE"
    echo "${fg_bold[black]}BOLD BLACK${reset_color}     PR_BOLD_BLACK"
    echo "${fg_bold[red]}BOLD RED${reset_color}         PR_BOLD_RED"
    echo "${fg_bold[green]}BOLD GREEN${reset_color}     PR_BOLD_GREEN"
    echo "${fg_bold[yellow]}BOLD YELLOW${reset_color}   PR_BOLD_YELLOW"
    echo "${fg_bold[blue]}BOLD BLUE${reset_color}       PR_BOLD_BLUE"
    echo "${fg_bold[magenta]}BOLD MAGENTA${reset_color} PR_BOLD_MAGENTA"
    echo "${fg_bold[cyan]}BOLD CYAN${reset_color}       PR_BOLD_CYAN"
    echo "${fg_bold[white]}BOLD WHITE${reset_color}     PR_BOLD_WHITE"
}

print_colors() {
    printf "|039| \033[39mDefault \033[m  |049| \033[49mDefault \033[m  |037| \033[37mLight gray \033[m     |047| \033[47mLight gray \033[m\n"
    printf "|030| \033[30mBlack \033[m    |040| \033[40mBlack \033[m    |090| \033[90mDark gray \033[m      |100| \033[100mDark gray \033[m\n"
    printf "|031| \033[31mRed \033[m      |041| \033[41mRed \033[m      |091| \033[91mLight red \033[m      |101| \033[101mLight red \033[m\n"
    printf "|032| \033[32mGreen \033[m    |042| \033[42mGreen \033[m    |092| \033[92mLight green \033[m    |102| \033[102mLight green \033[m\n"
    printf "|033| \033[33mYellow \033[m   |043| \033[43mYellow \033[m   |093| \033[93mLight yellow \033[m   |103| \033[103mLight yellow \033[m\n"
    printf "|034| \033[34mBlue \033[m     |044| \033[44mBlue \033[m     |094| \033[94mLight blue \033[m     |104| \033[104mLight blue \033[m\n"
    printf "|035| \033[35mMagenta \033[m  |045| \033[45mMagenta \033[m  |095| \033[95mLight magenta \033[m  |105| \033[105mLight magenta \033[m\n"
    printf "|036| \033[36mCyan \033[m     |046| \033[46mCyan \033[m     |096| \033[96mLight cyan \033[m     |106| \033[106mLight cyan \033[m\n"
}
