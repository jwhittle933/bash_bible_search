# !/bin/sh
. ./functions.sh
. ./api_key.sh

convert_user_input_book "This is a test"

bible_books='{"genesis": "GEN", "exodus": "EXO", "leviticus": "LEV"}'
echo "What book would you like to search?"
read read_book
echo "What chapter would you like to search?"
read read_chapter

case $read_book in
	genesis)
		book_choice="GEN"
		;;
	exodus)
		book_choice="EXO"
		;;
	leviticus)
		book_choice="LEV"
		;;
esac


books=$(curl --request GET --url https://api.scripture.api.bible/v1/bibles/0bc8836afa7427fa-01/books --header "api-key: $api_key" | jq '.data' | jq '.[].id')
passage=$(curl --request GET --url https://api.scripture.api.bible/v1/bibles/0bc8836afa7427fa-01/passages/${book_choice}.${read_chapter} --header 'api-key: 3f3c0c2f26e91bac4a9294bc0069a44d' | jq '.data.content')

for i in $books
do
	echo $i
done

echo $passage


