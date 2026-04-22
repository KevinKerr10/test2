#!/bin/bash

# --- VARIABLES ---
aoi_affection=10            # Aoi's starting affection level
aoi_lie_meter=0             # Tracks how many times you lie to Aoi
arima_affection=0           # Arima's affection level
arima_lie_meter=0           # Tracks lies to Arima (not used yet)
mizurin_affection=0         # Mizurin's affection level
mizurin_lie_meter=0         # Tracks lies to Mizurin


# Function to change affection
change_aoi_affection() {
    aoi_affection=$((aoi_affection + $1))   # Adds/subtracts value from Aoi affection
}
change_aoi_lie_meter() {
    aoi_lie_meter=$((aoi_lie_meter + $1))   # Adds to Aoi lie counter
}
change_arima_affection() {
    arima_affection=$((arima_affection + $1))   # Modifies Arima affection
}
change_arima_lie_meter() {
    arima_lie_meter=$((arima_lie_meter + $1))   # Modifies Arima lie counter
}
change_mizurin_affection() {
    mizurin_affection=$((mizurin_affection + $1))   # Modifies Mizurin affection
}
change_mizurin_lie_meter() {
    mizurin_lie_meter=$((mizurin_lie_meter + $1))   # Modifies Mizurin lie counter
}

# --- INTRO ---
read -p "Before we begin, what is your name? " name   # Gets player's name input

# --- WAKE UP SCENE ---
while true; do   # Loop continues until player gets up
    echo ""
    read -p "You wake up in your bed as usual. Your alarm is blaring right beside you, and sunlight pours through the window. Just a normal day... or is it? Do you want to get up and go outside? (y/n) " answer
    
    if [ "$answer" = "y" ]; then 

        break   # Exit loop if player chooses to get up
    elif [ "$answer" = "n" ]; then
        change_aoi_affection -1   # Lose affection for staying in bed

        while true; do   # Inner loop for repeated staying in bed

            echo ""
            read -p "You decide to stay in bed a little longer, but you can't shake the feeling that you're forgetting something important. Do you keep lying there? (y/n) " answer
            
            if [ "$answer" = "n" ]; then

                break 2   # Break out of BOTH loops
            elif [ "$answer" = "y" ]; then
                echo "Really? You’re seriously staying in bed?"
                change_aoi_affection -1   # Additional affection loss
            else 
                echo "Please type 'y' or 'n'."   # Input validation
            fi
        done
    else
        echo "Please type 'y' or 'n'."   # Input validation
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
if [ "$aoi_affection" -lt 8 ]; then
    echo "\"Way to keep me waiting... maybe next time I just won’t bother,\" she says, clearly annoyed."
else 
    echo "\"Hey, $name... took you long enough,\" she says with a small smile."
fi
echo "You seem weird to me. Do you not remember me or something?"
echo "1) You're just imagining it haha!"
echo "2) I don't know, I feel like something is just off today?"

while true; do

    read -p "Choose (1 or 2): " choice   # Player choice input

    if [ "$choice" = "1" ]; then
        change_aoi_lie_meter 1   # Player lies → increase lie meter
        echo "If you say so..."
        break
    elif [ "$choice" = "2" ]; then 
        while true; do
            read -p "Really, did something happen to you today? Is that why you were later than usual? (y/n) " answer

            if [ "$answer" = "y" ]; then 
                change_aoi_affection 1   # Honest answer → gain affection
                echo "Okay, I guess I'll forgive you today!"
                break 2
            elif [ "$answer" = "n" ]; then
                echo "Hmmmmm, so what did happen to you today?"
                echo "1) I tripped on my stairs."
                echo "2) Nah, you were actually right, that's why I was late."
                while true; do

                    read -p "Choose (1 or 2): " choice

                    case $choice in
                    1)
                        change_aoi_lie_meter 1   # Lie again
                        echo "Wow, I hope you're okay."
                        break 3
                        ;;
                    2)
                        echo "Ha! I knew it."   # Truth option
                        break 3
                        ;;
                    *)
                        echo "Please choose 1 or 2."   # Invalid input
                        ;;
                    esac
                done
            else
                echo "Please choose y or n."   # Invalid input
            fi
        done
    else 
        echo "Please choose 1 or 2."   # Invalid input
    fi
done

while true; do

    read -p "Changing the subject here, but I barely managed to finish my homework. Did you finish your English homework? (y/n) " answer

    if [ "$answer" = "y" ]; then
        echo "Wow, that's unusual. I thought you would've procrastinated like usual. Why the sudden change of heart?"
        echo "1) I was feeling motivated yesterday!"
        echo "2) I had nothing else to do."
        echo "3) I didn't actually do it."
        while true; do

            read -p "(Choose 1, 2, or 3): " choice

            case $choice in 
            1)
                change_aoi_affection 1   # Gain affection
                change_aoi_lie_meter 1   # But also lying

                echo "I guess even someone like you can choose to do homework sometimes."
                break 2
                ;;
            2)
                while true; do

                    read -p "Really?.. Aren't you usually watching anime or something in your free time? (y/n) " answer
                    if [ "$answer" = "y" ]; then
                        echo "Sometimes I never understand you, sigh."
                        break 3
                    elif [ "$answer" = "n" ]; then
                        echo "I could swear that's all you would do. Whatever, I guess I was imagining it."
                        break 3
                    else 
                        echo "Please answer with y or n."
                    fi
                done 
                ;;
            3)
                echo "That's more like the $name I know lol!"
                break 2
                ;;
            *)
                echo "Please choose 1, 2, or 3."
                ;;
            esac
        done
    elif [ "$answer" = "n" ]; then
        echo "Just like always lol."
        break
    else 
        echo "Please answer with y or n."
    fi
done

echo "You guys continue walking down the street. You have no idea where you are going, but it looks like a lot of students in the same uniform as you are headed in the same direction."

sleep 1   # Pause for pacing

echo "After walking for a little bit more, a school comes into view."
echo "Hey $name, before I go, good luck with your first class. I hope you make some great friends!"

echo "1) Don't worry, I'll have the whole school under my command."
echo "2) Don't expect too much of me!"
echo "3) You too!"

while true; do

    read -p "(Choose 1, 2, or 3): " choice

    case $choice in 
    1)
        echo "Hahaha, I'd like to see the day."
        break
        ;;
    2)
        echo "Don't doubt yourself. You've got this."
        break
        ;;
    3)

        change_aoi_affection 1   # Positive response → gain affection

        echo "Thanks!"
        break
        ;;
    *)
        echo "Please choose 1, 2, or 3."
        ;;
    esac
done

echo "You both walk off to your designated classes."

sleep 1   # Pause

echo "Upon arriving at the classroom, you scan around. The teacher seems to have not arrived yet."
echo "I guess it's time to choose where to sit, you think to yourself."

echo "1) Back corner near the window"
echo "2) Back corner near the wall"
echo "3) Front row near the window"
echo "4) Front row near the door"

while true; do

    read -p "(Choose 1, 2, 3, or 4): " choice

    case $choice in
    1) 
        echo "You walk to the back corner, the MC seat."
        echo "The kid in front of you turns around. Going for the MC seat, I see. I'm Arima Yamaguchi, by the way. I look forward to working with you."

        echo "1) Screw you!"
        echo "2) Same here, I'm $name by the way."
        echo "3) Better not steal my spotlight!"

        while true; do

            read -p "(Choose 1, 2, or 3): " choice

            case $choice in
            1) 

                change_arima_affection -3   # Major negative reaction

                echo "Wow, that was unexpectedly rude."
                echo "Well, I hope you warm up to me in the future."
                break 2
                ;;
            2)

                change_arima_affection 2   # Positive relationship gain

                echo "For a moment, I thought you'd say something like screw you lol, who would do that."
                echo "Well, I'm glad I have someone to talk to now at least."
                break 2
                ;;
            3) 

                change_arima_affection 1   # Small positive

                echo "I'll steal all your spotlight haha!"
                break 2
                ;;
            *)
                echo "Please choose 1, 2, or 3."
                ;;
            esac
        done   
        ;;
    2)
        echo "You walk to the back corner near the wall, now this is a nice seat."
        echo "Once you finally settle down into your new seat, the girl next to you turns in your direction."
        while true; do

            read -p "Hi! I'm Mizurin Kitagawa! You're Aoi's friend, right? (y/n) " answer

            if [ "$answer" = "y" ]; then

                change_mizurin_affection 2   # Gain affection for honesty

                echo "Great, so I wasn't just imagining it. Aoi told me about you. I hope we can be great friends this year!"

                echo "1) Same here, I hope we can be great friends."
                echo "2) I hope I can get some quiet this year!"
                echo "3) No, you were imagining it, you're still in my genjutsu."

                while true; do 

                    read -p "(Choose 1, 2, or 3): " choice

                    case $choice in
                    1)
                        echo "Yay! I'm looking forward to it!"
                        break 3
                         ;;
                    2)
                        echo "Ehh?? That's kinda mean!"
                        break 3
                        ;;
                    3)
                        echo "Whaaat?? That's scary..."
                        break 3
                        ;;
                    *)
                        echo "Please choose 1, 2, or 3."
                        ;;
                    esac
                done
            elif [ "$answer" = "n" ]; then

                change_mizurin_lie_meter 1   # Lie detected

                echo "Whattttttt? I could swear it was you."
                echo "Just kidding, I know you're lying hehe."
                echo "What's your name? Aoi didn't really tell me that."

                echo "1) Oh, I'm $name. Thought I might've been able to fool you but I guess not..."
                echo "2) I'm $name, didn't know Aoi's friends were so extroverted. Sigh."
                echo "3) I'm Batman."

                while true; do

                    read -p "(Choose 1, 2, or 3): " choice

                    case $choice in 
                    1) 
                        echo "Don't underestimate my memory, $name!"
                        break 3
                        ;;
                    2) 
                        echo "Oh you bet we are!... or at least I am, and I won't let you escape hehe."
                        break 3
                        ;;
                    3)  
                        echo "...... uhhh she said you were weird but I sure wasn't expecting that lol. Well nice to meet you... Batman?"
                        break 3
                        ;;
                    *)
                        echo "Please choose 1, 2, or 3."
                        ;;
                    esac
                done
            else
                echo "Please choose y or n."
            fi
        done
        ;;
    *)
        echo "Please choose 1, 2, 3, or 4."
        ;;
    esac
done

