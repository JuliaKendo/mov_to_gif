#!/bin/bash

output_dir="output"

#трюк необходимый для правильной передачи экранированных пробелов из коммандной строки
IFS=$'\n'

extensions=(mp4 mpeg4 mov)

error_exit()
{
  status=$?
  if [ $status -eq 1 ]; then
    echo "general error"
  elif [ $status -eq 2 ]; then
    echo "misuse of shell builtins"
  elif [ $status -eq 126 ]; then
    echo "command invoked cannot execute"
  elif [ $status -eq 127 ]; then
    echo "command not found"
  elif [ $status -eq 128 ]; then
    echo "invalid argument"
  fi    
  exit 1
}


if [ -n "$1" ] 
then

  output_file=""
  
  for i in ${extensions[@]}
  do
    if [ "$1" != "$(basename "$1" .$i)"  ]
    then
      output_file="$(basename "$1" .$i)"
    fi
  done
  
  if [ -z "$output_file" ]
  then
    echo "unsupported extension"
    exit 1
  fi

  ffmpeg -i $1 -vf scale=320:-1 -r 10 $output_dir/ffout%3d.png || error_exit
  convert -delay 8 -loop 0 $output_dir/ffout*.png "$output_file.gif" || error_exit
  echo "$output_file.gif written"
else

  echo "specify file to convert"

fi

rm -f $output_dir/*.*
