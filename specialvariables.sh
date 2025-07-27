NAME1=$1
NAME2=$2

echo "My name is $NAME1"
echo "My name is $NAME2"
echo "$NAME1 and $NAME2 are friends"
echo "These $# are going for lunch"

FOOD=("INDIAN" "ITALIAN" "CHINESE" "FRANCE")

echo "i need all types of:${FOOD[@]}"
echo "my script name is: $0"
echo "my script is running on: $PWD"
echo "my home directory is $HOME"
echo "$USER -- i am running the script"
echo "my current pid is: $$"
echo "my variables are: $?"