USER = $(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0|cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started at : $(date)" $>>$LOG_FILE

if [ $USER -ne 0 ]
then
    echo -e "$R ERROR:: please run  the script with root access $N"$>>$LOG_FILE
    exit 1
else
    echo " you are runnig with root access"$>>$LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0]
    then
        echo -e "Installing $2 is ...$G SUCCESS $N"$>>$LOG_FILE
    else
        echo -e "Installing $2 is ...$R FAILURE $N"$>>$LOG_FILE
        exit 1
    fi
}

dnf list installed mysql $>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo " MYSQL isnot installed going to install"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "Nothing to do $Y mysql is already installed$N"$>>$LOG_FILE
fi