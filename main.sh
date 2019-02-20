# !/bin/sh

api_key=3f3c0c2f26e91bac4a9294bc0069a44d
bible_books='{"genesis": "GEN", "exodus": "EXO", "leviticus": "LEV"}'
echo "What book would you like to search?"
read read_book

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


books=$(curl --request GET --url https://api.scripture.api.bible/v1/bibles/0bc8836afa7427fa-01/books --header 'api-key: 3f3c0c2f26e91bac4a9294bc0069a44d' | jq '.data' | jq '.[].id')
passage=$(curl --request GET --url https://api.scripture.api.bible/v1/bibles/0bc8836afa7427fa-01/passages/${book_choice}.1 --header 'api-key: 3f3c0c2f26e91bac4a9294bc0069a44d' | jq '.data.content')

for i in $books
do
	echo $i
done

echo $passage