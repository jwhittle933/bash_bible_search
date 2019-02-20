# !/bin/sh

convert_user_input_book() 
{
	BOOK=$1
	shift; shift;
	
	tr '[A-Z]' '[a-z]' < $BOOK
	echo $BOOK
	comments=$@
}