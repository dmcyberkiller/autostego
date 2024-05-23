#!/bin/bash
	print_banner() {
    echo "******************************************			*********************"| lolcat
    echo "*    Welcome to My Auto Steghide Tool     *			*                   *"| lolcat
    echo "*       Created By dmcyberkiller          ***************************  autostego.sh      *"| lolcat
    echo "*              Version 1.5                *			*                   *"| lolcat
    echo "******************************************			*********************"| lolcat
}	

print_banner
hide_file() {
    local image=$1
    local file_to_hide=$2
    local password=$3

    steghide --embed --passphrase "$password" -ef "$file_to_hide" -cf "$image" -q
    if [ $? -eq 0 ]; then
        echo "File '$file_to_hide' hidden in '$image' with password '$password'"
    else
        echo "Failed to hide file '$file_to_hide' in '$image'"
    fi
}
extract_file() {
    local image=$1
    local password=$2

    steghide --extract --passphrase "$password" -sf "$image" -q
    if [ $? -eq 0 ]; then
        echo "File extracted from '$image' with password '$password'"
    else
        echo "Failed to extract file from '$image'"
    fi
}
if [ "$#" -ne 4 ]; then
echo "# If Embed, Then Use: $0 <image_file> <file_to_hide> <password> <embed>"
echo "# If Extract, Then Use: $0 <image_file> <extracted_file_name> <password> <extract>"
echo "# Also you can read my README.txt file" | lolcat
exit 1
fi
	
image=$1
file_to_hide_extracted_file=$2
password=$3
action=$4

if [ ! -f "$image" ]; then
    echo "Error: Image file '$image' not found"
    exit 1
fi

if [ "$action" == "embed" ] && [ ! -f "$file_to_hide_extracted_file" ]; then
    echo "Error: File to hide '$file_to_hide_extracted_file' not found"
    exit 1
fi

case $action in
    embed)
        hide_file "$image" "$file_to_hide_extracted_file" "$password"
        ;;
    extract)
        extract_file "$image" "$password"
        ;;
    *)
        echo "Invalid action. Please specify 'embed' or 'extract'."
        exit 1
        ;;
esac
