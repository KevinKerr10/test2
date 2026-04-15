#!/bin/bash

# --- VARIABLES ---
affection=10

# Function to decrease affection
Lose_1Affection() {
    affection=$((affection - 1))
}

# --- INTRO ---
read -p "Before we begin, what is your name? " name

# --- WAKE UP SCENE ---
while true; do
    echo ""
    read -p "You wake up in your bed as usual. Your alarm is blaring right beside you, and sunlight pours through the window. Just a normal day... or is it?\nDo you want to get up and go outside? (y/n) " answer
    
    if [ "$answer" = "y" ]; then 
        # Player chooses to get up immediately
        break 

    elif [ "$answer" = "n" ]; then
        # Player stays in bed → lose affection
        Lose_1Affection

        # --- SECOND CHOICE LOOP ---
        while true; do
            echo ""
            read -p "You decide to stay in bed a little longer, but you can't shake the feeling that you're forgetting something important.\nDo you keep lying there? (y/n) " answer
            
            if [ "$answer" = "n" ]; then
                # Player finally gets up → exit BOTH loops
                break 2

            elif [ "$answer" = "y" ]; then
                echo "Really? You’re seriously staying in bed?"
                Lose_1Affection

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

# --- DEBUG (optional, remove later) ---
# echo "(Affection: $affection)"