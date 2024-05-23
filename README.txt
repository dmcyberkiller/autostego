
			$ whoami
			  dmcyberkiller

## How to use this autostego.sh tool made by love with dmcyberkiller

This tool is for "LAZY" people. Oh! hoo! just joking...

## Usage:-

# embed
If you are embed any text file into an image file then you use:-
./autostego.sh image.jpg secretfile.txt password embed > Press Enter
here you replace your image file, secret-text file and password.
Ex:- ./autostego.sh image.jpg myfile.txt 12345 embed

# extract
If you are extract text file from image then you use:- 
./autostego.sh image.jpg outputfile.txt password extract > Press Enter
here you replace your image file, outputfile name* and definitely password
Ex:- ./autostego.sh image.jpg myoutfile.txt 12345 extract

*You don't know what's the outputfile name, so you type anything like:- abcd, myfile, yourname, with or without extension like (.txt) just for RULE you give anything name. Otherwise command didn't running.


**Remember**
Which Password you use during Embeded time, same Password is required during Extraction the hidden file from the image.


#########################################################################

[What is the background process of this autostego tool]

*NOTE*
-ef --> embedfile
-cf --> coverfile
-sf --> stegofile

** During embed time, below this command is running:-
	emb.txt in cvr.jpg: steghide embed -cf cvr.jpg -ef emb.txt
	enter passphrase
	re-enter passphrase

** During extract time, below this command is running:-
	steghide extract -sf stg.jpg
	enter passphrase
