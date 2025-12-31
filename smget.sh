#!/usr/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

show_title() {
    clear
    if command -v figlet &> /dev/null; then
        figlet "SM GET"
    else
        echo -e "==SM GET=="
    fi
    echo -e "${YELLOW}by Nullbyte </> ${NC}"
}

show_help() {
    clear
    echo -e "${RED} SM GET HELP ${NC}\n"
    echo -e "use $0 [option] [url]\n"
    echo -e "${RED} options ${NC}\n"
    echo -e "[install] Download the dependencies required for the tool\n"
    echo -e "[video]   Download video\n"
    echo -e "[audio]   Download audio\n"
}

main() {
    show_title
    arg1="$1"
    arg2="$2"

    if [ "$arg1" == "install" ]; then
        echo -e "${YELLOW} install dependencies ${NC}"
        if command -v figlet &> /dev/null; then
            echo -e "${YELLOW}[*] figlet already installed"
        else
            echo -e "${YELLOW}[*] download figlet ${NC}"
            apt install figlet -y
        fi

        if command -v python3 &> /dev/null; then
            echo -e "${YELLOW}[*] python3 already installed"
        else
            echo -e "${YELLOW}[*] download python3 ${NC}"
            apt install python3 -y
        fi

        if command -v pip &> /dev/null; then
            echo -e "${YELLOW}[*] pip already installed ${NC}"
        else
            echo -e "${YELLOW}[*] download pip ${NC}"
            apt install pip -y
        fi

        if command -v yt-dlp &> /dev/null; then
            echo -e "${YELLOW}[*] yt-dlp already installed ${NC}"
        else
            echo -e "${YELLOW}[*] install yt-dlp ${NC}"
            pip install yt-dlp
        fi
    fi

    if [ "$arg1" == "help" ]; then
        show_help
    fi

    if [ "$arg1" == "video" ]; then
        yt-dlp "$arg2"
    fi

    if [ "$arg1" == "audio" ]; then
        yt-dlp -x --audio-format mp3 "$arg2"
    fi
}

main "$@"
