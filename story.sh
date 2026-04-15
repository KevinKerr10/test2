#!/bin/bash
affection=0
while true; do
    read -p "you wake up in yor bed same as usual, alarm blaring right next to you, sun shining throught the windows, just a normal day. would you like to go outside? y/n" answer
    
    if [ "$answer" = "y" ];then 
        break 
    elif [ "$answer" = "n" ];then
        while true; do
            read -p "You decide to lay in bed a bit longer but you cant get the feeling that you have something to do out of your head. Will you continue to stay in bed? y/n" answer
            
            if [ "$answer" = "n" ];then
                break 2
            elif [ "$answer" = "y" ];then
                echo "really?"
            else 
                echo "please type y or n."
            fi
        done
    else
        echo "please type y or n."
    fi
done
echo "You get out of bed and begin to do your usual routine, you brush your teeth, yk the whole spiel. Once you finish you swing your front door wide open and someone seems to be waiting for you just at the tip of your driveway."