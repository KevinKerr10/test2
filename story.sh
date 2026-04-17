#!/bin/bash

# --- VARIABLES ---
aoi_affection=10
aoi_lie_meter=0
arima_affection=0
arima_lie_meter=0

# Function to decrease affection
change_aoi_affection() {
    aoi_affection=$((aoi_affection + $1))
}
change_aoi_lie_meter() {
    aoi_lie_meter=$((aoi_lie_meter + $1))
}
change_arima_affection() {
    arima_affection=$((arima_affection + $1))
}
change_arima_lie_meter() {
    arima_lie_meter=$((arima_lie_meter + $1))
}



# --- INTRO ---
read -p "Before we begin, what is your name? " name

# --- WAKE UP SCENE ---
while true; do
    echo ""
    read -p "You wake up in your bed as usual. Your alarm is blaring right beside you, and sunlight pours through the window. Just a normal day... or is it? Do you want to get up and go outside? (y/n) " answer
    
    if [ "$answer" = "y" ]; then 
        # Player chooses to get up immediately
        break 

    elif [ "$answer" = "n" ]; then
        # Player stays in bed → lose affection
        change_aoi_affection -1

        # --- SECOND CHOICE LOOP ---
        while true; do
            echo ""
            read -p "You decide to stay in bed a little longer, but you can't shake the feeling that you're forgetting something important. Do you keep lying there? (y/n) " answer
            
            if [ "$answer" = "n" ]; then
                # Player finally gets up → exit BOTH loops
                break 2

            elif [ "$answer" = "y" ]; then
                echo "Really? You’re seriously staying in bed?"
                change_aoi_affection -1

            else 
                echo "Please type 'y' or 'n'."
            fi
        done

    else
        echo "Please type 'y' or 'n'."
    fi
done

# --- OUTSIDE SCENE ---
echo ""
echo "You finally get out of bed and go through your usual routine—brushing your teeth, getting dressed, the whole deal."
echo "Once you're done, you swing your front door open and step outside."

echo ""
echo "At the edge of your driveway, someone is waiting."
echo "You walk closer and realize... it's a girl."
echo "She steps toward you and begins to speak."

# --- REACTION BASED ON AFFECTION ---
echo ""
if [ "$affection" -lt 8 ]; then
    echo "\"Way to keep me waiting... maybe next time I just won’t bother,\" she says, clearly annoyed."
else 
    echo "\"Hey, $name... took you long enough,\" she says with a small smile."
fi
echo "You seem weird to me do you not remember me or something"
echo "1) Your just imagining it haha!"
echo "2) I don't know I feel like something is just off today?"
read -p "choose (1 or 2): " choice
if [ "$choice" = 1 ];then
    change_aoi_lie_meter 1
    echo "If you say so..."
elif [ "$choice" = 2 ];then 
    read -p "Really, did something happen to you today? Is that why you we're more late than usual? (y/n)." answer
    if [ "$answer" = "y" ];then 
        change_aoi_affection 1
        echo "Okay, I guess I'll forgive you today!"
    elif [ "$answer" = "n" ];then
        echo "hmmmmm so what did happen to you today"
        echo "1) I tripped on my stairs."
        echo "2) Nah you were actually right thats why I was late."
        read -p "choose (1 or 2): " choice
        if [ "$choice" = 1 ];then
            change_aoi_lie_meter 1
            echo "Wow I hope your ok."
        elif [ "$choice" = 2 ];then
            echo "ha! I knew it."
        else 
            echo "Please choose 1 or 2"
        fi
    else
        echo "Please choose y or n"
    fi
else 
    echo "Please choose 1 or 2"
fi
read -p "Changing the subject here but I barley managed to finisg my homework, did you finish your english homework? (y/n)" answer
    if [ "$answer" = "y" ];then
        echo "Wow thats unusual I thought you would've procrasitnated like usual why the sudden change of heart.?"
        echo "1) I was feeling motivated yesterday!"
        echo "2) I had nothing else to do."
        echo "3) I didn't actually do it."
        read -p "(Choose 1, 2, or 3)" choice

        case $choice in 
        1)  change_aoi_affection 1
            change_aoi_lie_meter 1
            echo "I guess even someone like you can choose to do homework somtimes."
            ;;
        2)  read -p "really?.. Aren't you usually watching anime or something in your free time? (y/n)" answer
            if [ "$answer" = "y" ];then
                echo "Sometimes I never understand you sigh."
            elif [ "$answer" = "n" ];then
                echo "I could swear thats all you would do, whatever I guess I was imagining it."
            else 
                echo "Please answer with y, or n."
            fi
            ;;
        3)  echo "Thats more like the $name I know lol!"
            ;;
        esac
    elif [ "$answer" = "n" ];then
        echo "just like always lol."
    else echo "Please answer with y, or n."
    fi
    echo "You guys continue walking down the street, you have no idea where you ae going but it looks like alot of students in the same uniform as you are headed in the saem direction."
    sleep 1
    echo "After walking for a little bit mroea  school comes into view."
    echo "Hey Kevin before I goodluck with your first class I hope you make some great friends!"
    echo "1) Don't worry I'll have the whole school under my command"
    echo "2) Don't expect to much of me!"
    echo "3) You too!"
    read -p "(Choose 1, 2, or 3)" choice

    case $choice in 
    1) echo "Hahaha I'd like to see the day."
        ;;
    2) echo "Don't doubt youself, You've got this."
        ;;
    3) change_aoi_affection 1
        echo "Thanks!"
        ;;
    esac
    echo "You both walk off to your designated classes."
    sleep 1
    echo "Upon arriving to the classroom you scan around, the teacher seems to have not arrived yet."
    echo "I guess its time to choose where to sit you think to yourself"
    echo "1) Back corner near the window"
    echo "2) Back corner near the wall"
    echo "3) front row near the window"
    echo "4) front row near the door"
    read -p "(Choose 1,2,3, or 4)" choice

    case $choice in
    1) 
        echo "you walk to the back corner, the mc seat."
        echo "The kid in front of you turns around. Going for the mc seat I see, I'm Arima Yamaguchi btw. I look forward to working with you."
        echo "1) Screw you!"
        echo "2) Same here I'm $name btw"
        echo "3) Better not steal my spotlight!"
        read -p "(choose 1,2, or 3)" choice

        case $choice in
        1) 
            change_arima_affection -3
            echo "Wow that was unexpectedly rude"
            echo "Well I hope you warm up to me in the future"
            ;;
        2)
            change_arima_affection 2
            echo "For a moment I thought you'd say something like screw you lol, who would do that."
            echo "Well I'm glad I have someone to talk to now atleast."
            ;;
        3) 
            change_arima_affection 1
            echo "I'll steal all your spotlight haha!"
            ;;
        esac
        ;;
    2)
        echo











# --- DEBUG (optional, remove later) ---
