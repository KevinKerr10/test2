#!/bin/bash

# --- VARIABLES ---
affection=10
lie_meter=0

# Function to decrease affection
change_affection() {
    affection=$((affection + $1))
}
change_lie_meter() {
    lie_meter=$((lie_meter + $1))
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
        change_affection -1

        # --- SECOND CHOICE LOOP ---
        while true; do
            echo ""
            read -p "You decide to stay in bed a little longer, but you can't shake the feeling that you're forgetting something important. Do you keep lying there? (y/n) " answer
            
            if [ "$answer" = "n" ]; then
                # Player finally gets up → exit BOTH loops
                break 2

            elif [ "$answer" = "y" ]; then
                echo "Really? You’re seriously staying in bed?"
                change_affection -1

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
    change_lie_meter 1
    echo "If you say so..."
elif [ "$choice" = 2 ];then 
    read -p "Really, did something happen to you today? Is that why you we're more late than usual? (y/n)." answer
    if [ "$answer" = "y" ];then 
        change_affection 1
        echo "Okay, I guess I'll forgive you today!"
    elif [ "$answer" = "n" ];then
        echo "hmmmmm so what did happen to you today"
        echo "1) I tripped on my stairs."
        echo "2) Nah you were actually right thats why I was late."
        read -p "choose (1 or 2): " choice
        if [ "$choice" = 1 ];then
            change_lie_meter 1
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
read -p "so did you finish your english homework? (y/n)" answer
    if [ "$answer" = "y" ];then
        echo "Wow thats unusual I thought you would've procrasitnated like usual why the sudden change of heart.?"
        echo "1) I was feeling motivated yesterday!"
        echo "2) I had nothing else to do."
        echo "3) I didn't actually do it."
        read -p "(Choose 1, 2, or 3)" choice

        case $choice in 
        1)  change_affection 1
            change_lie_meter 1
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






# --- DEBUG (optional, remove later) ---
