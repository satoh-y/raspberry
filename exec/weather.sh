#!/bin/sh

ruby -Ku /Script/exec/weather_osaka.rb &



#!/bin/bash

if [ $# -ne 3 ]; then
  echo "使用法: $0 <ログインID> <Linux内UID> <TSOアカウント使用フラグ（使用しない場合は0）>"
  exit 1
fi

login_id=$1
uid=$2
TSOUSEFLG=$3

primary_group="nko-users"

useradd -m -s /bin/rbash -u $uid -g $primary_group -G oframe1 $login_id
home_dir="/home/$login_id"

prepared_dir="/path/to/prepared"


cp -p "$prepared_dir/bashrc" "$home_dir/.bashrc"
cp -p "$prepared_dir/bash_profile" "$home_dir/.bash_profile"
cp -p "$prepared_dir/bash_logout" "$home_dir/.bash_logout"
cp -rp "$prepared_dir/bin" "$home_dir/bin"

mkdir "$home_dir/.TACF"
chown $login_id:$primary_group "$home_dir/.TACF"



if [ $TSOUSEFLG -eq 1 ]; then
  ## 
else
  sed -i 's/TSOUSEFLG=1/TSOUSEFLG=0/' "$home_dir/.bash_profile"
fi



echo "ユーザー $login_id を作成しました。"

