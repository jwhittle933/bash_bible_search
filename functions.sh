# !/bin/sh

convert_user_input_book() 
{
	BOOK=$1
	shift; shift;
	echo "function call $BOOK"
	comments=$@
}