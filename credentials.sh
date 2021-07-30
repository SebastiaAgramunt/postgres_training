if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

echo $DB_NAME