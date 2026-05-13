#!/bin/bash

# --- VARIABLES ---
aoi_affection=10
aoi_lie_meter=0
arima_affection=0
arima_lie_meter=0
mizurin_affection=0
mizurin_lie_meter=0
umiko_affection=0
umiko_lie_meter=0
kirky_affection=-2
kirky_lie_meter=0
# --- UI HELPERS ---
clear_screen() {
    clear
}

divider() {
    echo "----------------------------------------"
}

# Function to change affection
change_aoi_affection() { aoi_affection=$((aoi_affection + $1)); }
change_aoi_lie_meter() { aoi_lie_meter=$((aoi_lie_meter + $1)); }
change_arima_affection() { arima_affection=$((arima_affection + $1)); }
change_arima_lie_meter() { arima_lie_meter=$((arima_lie_meter + $1)); }
change_mizurin_affection() { mizurin_affection=$((mizurin_affection + $1)); }
change_mizurin_lie_meter() { mizurin_lie_meter=$((mizurin_lie_meter + $1)); }
change_umiko_affection() { umiko_affection=$((umiko_affection + $1)); }
change_umiko_lie_meter() { umiko_lie_meter=$((umiko_lie_meter +$1)); }

pause() {
    echo ""
    read -r -p "Press Enter to continue"
    clear_screen
}

# --- INTRO ---
clear_screen
divider
read -p "Before we begin, what is your name? " name
divider
clear_screen

# --- WAKE UP SCENE ---
while true; do
    divider
    read -p "You wake up in your bed as usual. Your alarm is blaring right beside you, and sunlight pours through the window. Just a normal day... or is it? Do you want to get up and go outside? (y/n) " answer
    
    if [ "$answer" = "y" ]; then 
        clear_screen
        break
    elif [ "$answer" = "n" ]; then
        change_aoi_affection -1

        while true; do
            divider
            read -p "You decide to stay in bed a little longer, but you can't shake the feeling that you're forgetting something important. Do you keep lying there? (y/n) " answer
            
            if [ "$answer" = "n" ]; then
                clear_screen
                break 2
            elif [ "$answer" = "y" ]; then
                echo ""
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
clear_screen
divider
echo "You finally get out of bed and go through your usual routine—brushing your teeth, getting dressed, the whole deal."
pause

divider
echo "Once you're done, you swing your front door open and step outside."
pause

divider
echo "At the edge of your driveway, someone is waiting."
pause

divider
echo "You walk closer and realize... it's a girl."
pause

divider
echo "She steps toward you and begins to speak."
pause

divider
if [ "$aoi_affection" -lt 8 ]; then
    echo "\"Way to keep me waiting... maybe next time I just won’t bother,\" she says, clearly annoyed."
else 
    echo "\"Hey, $name... took you long enough,\" she says with a small smile."
fi

while true; do
    divider
    echo "1) Do I know you?"
    echo "2) Sorry how do I pronounce your name again"
    echo "3) My bad good to see you again!"
    read -p "(Choose 1,2, or 3) " choice

    case $choice in
    1) 
        echo "Haha funny joke.... I'm your good friend Aoi dummy"
        pretended_to_know=false
        pause
        break
        ;;
    2)  
        echo "\"Aoi like Ah-oy, you seemed to know before..\" She says squinting at you"
        pretended_to_know=false
        pause
        break
        ;;
    3) 
        change_aoi_lie_meter 1
        echo "Yea better not hold me up again $name, or I'll egg your house while waiting"
        pretended_to_know=true
        pause
        break
        ;;
    *)
        echo "Make sure to select 1,2, or 3"
        ;;
    esac
done

if [ "$pretended_to_know" = true ];then

    while true; do
        divider
        echo "You seem weird to me. Is something up with your memory?"
        echo "1) You're just imagining it haha!"
        echo "2) I don't know, I feel like something is just off today?"
        read -p "Choose (1 or 2): " choice

        if [ "$choice" = "1" ]; then
            change_aoi_lie_meter 1
            echo "If you say so..."
            pause
            break
        elif [ "$choice" = "2" ]; then 
            while true; do
                read -p "Really, did something happen to you today? Is that why you were later than usual? (y/n) " answer

                if [ "$answer" = "y" ]; then 
                    change_aoi_affection 1
                    echo "Okay, I guess I'll forgive you today!"
                    pause
                    break 2
                elif [ "$answer" = "n" ]; then
                    while true; do
                        divider
                        echo "Hmmmmm, so what did happen to you today?"
                        echo "1) I tripped on my stairs."
                        echo "2) Nah, you were actually right, that's why I was late."
                        read -p "Choose (1 or 2): " choice

                        case $choice in
                        1)
                            change_aoi_lie_meter 1
                            echo "Wow, I hope you're okay."
                            pause
                            break 3
                            ;;
                        2)
                            echo "Ha! I knew it."
                            pause
                            break 3
                            ;;
                        *)
                            echo "Please choose 1 or 2."
                            ;;
                        esac
                    done
                else
                    echo "Please choose y or n."
                fi
            done
        else 
            echo "Please choose 1 or 2."
        fi
    done
fi

while true; do
    divider
    read -p "She looks at her bag and than looks back at you. \"You finished your english homework right?\" she says (y/n) " answer

    if [ "$answer" = "y" ]; then
        while true; do
            divider
            echo "Wow, that's unusual. I thought you would've procrastinated like usual. Why the sudden change of heart?"
            echo "1) I was feeling motivated yesterday!"
            echo "2) I had nothing else to do."
            echo "3) I didn't actually do it."
            read -p "(Choose 1, 2, or 3): " choice

            case $choice in 
            1)
                change_aoi_affection 1
                change_aoi_lie_meter 1
                echo "I guess even someone like you can choose to do homework sometimes."
                pause
                break 2
                ;;
            2)
                while true; do
                    read -p "Really?.. Aren't you usually watching anime or something in your free time? (y/n) " answer
                    if [ "$answer" = "y" ]; then
                        echo "Sometimes I never understand you, sigh."
                        pause
                        break 3
                    elif [ "$answer" = "n" ]; then
                        echo "I could swear that's all you would do. Whatever, I guess I was imagining it."
                        pause
                        break 3
                    else 
                        echo "Please answer with y or n."
                    fi
                done 
                ;;
            3)
                echo "That's more like the $name I know lol!"
                pause
                break 2
                ;;
            *)
                echo "Please choose 1, 2, or 3."
                ;;
            esac
        done
    elif [ "$answer" = "n" ]; then
        echo "Just like always lol."
        pause
        break
    else 
        echo "Please answer with y or n."
    fi
done

divider
echo "You guys continue walking down the street. You have no idea where you are going, but it looks like a lot of students in the same uniform as you are headed in the same direction."
pause
divider
echo "After walking for a little bit more, a school comes into view."
pause
while true; do
    echo "Hey $name, before I go, good luck with your first class. I hope you make some great friends!"
    echo "1) Don't worry, I'll have the whole school under my command."
    echo "2) Don't expect too much of me!"
    echo "3) You too!"

    read -p "(Choose 1, 2, or 3): " choice

    case $choice in 
    1)
        echo "Hahaha, I'd like to see the day."
        pause
        break
        ;;
    2)
        echo "Don't doubt yourself. You've got this."
        pause
        break
        ;;
    3)
        change_aoi_affection 1
        echo "Thanks!"
        pause
        break
        ;;
    *)
        echo "Please choose 1, 2, or 3."
        ;;
    esac
done

divider
echo "You both walk off to your designated classes."
pause

while true; do
    divider
    echo "Upon arriving at the classroom, you scan around. The teacher seems to have not arrived yet."
    pause
    echo "I guess it's time to choose where to sit."

    echo "1) Back corner near the window"
    echo "2) Back corner near the wall"
    echo "3) Front row near the window"
    echo "4) Front row near the door"
    read -p "(Choose 1, 2, 3, or 4): " choice

    case $choice in
    1)
        while true; do
            divider
            echo "You walk to the back corner, the MC seat."
            pause
            echo "The kid in front of you turns around. \"Going for the MC seat, I see. I'm Arima Yamaguchi, by the way. I look forward to working with you\""

            echo "1) Screw you!"
            echo "2) Same here, I'm $name by the way."
            echo "3) Better not steal my spotlight!"
            read -p "(Choose 1, 2, or 3): " choice

            case $choice in
            1)
                change_arima_affection -3
                echo "Wow, that was unexpectedly rude."
                echo "Well, I hope you warm up to me in the future."
                pause
                break 2
                ;;
            2)
                change_arima_affection 2
                echo "For a moment, I thought you'd say something like screw you lol, who would do that."
                echo "Well, I'm glad I have someone to talk to now at least."
                pause
                break 2
                ;;
            3)
                change_arima_affection 1
                echo "I'll steal all your spotlight haha!"
                pause
                break 2
                ;;
            *)
                echo "Please choose 1, 2, or 3."
                ;;
            esac
        done
        ;;
    2)
        divider
        echo "You walk to the back corner near the wall, now this is a nice seat."
        echo "Once you finally settle down into your new seat, the girl next to you turns in your direction."
        pause

        while true; do
            read -p "Hi! I'm Mizurin Kitagawa! You're Aoi's friend, right? (y/n) " answer

            if [ "$answer" = "y" ]; then
                change_mizurin_affection 2

                while true; do
                    divider
                    echo "Great, so I wasn't just imagining it. Aoi told me about you. I hope we can be great friends this year!"

                    echo "1) Same here, I hope we can be great friends."
                    echo "2) I hope I can get some quiet this year!"
                    echo "3) No, you were imagining it, you're still in my genjutsu."
                    read -p "(Choose 1, 2, or 3): " choice

                    case $choice in
                    1) echo "Yay! I'm looking forward to it!"; pause; break 3 ;;
                    2) echo "Ehh?? That's kinda mean!"; pause; break 3 ;;
                    3) echo "Whaaat?? That's scary..."; pause; break 3 ;;
                    *) echo "Please choose 1, 2, or 3." ;;
                    esac
                done

            elif [ "$answer" = "n" ]; then
                change_mizurin_lie_meter 1

                while true; do
                    divider
                    echo "Whattttttt? I could swear it was you."
                    pause
                    echo "Just kidding, I know you're lying hehe."
                    pause
                    echo "Anyways what's your name? Aoi didn't really tell me that."

                    echo "1) Oh, I'm $name. Thought I might've been able to fool you but I guess not..."
                    echo "2) I'm $name, didn't know Aoi's friends were so extroverted. Sigh."
                    echo "3) I'm Batman."
                    read -p "(Choose 1, 2, or 3): " choice

                    case $choice in
                    1) echo "Don't underestimate my memory, $name!"; pause; break 3 ;;
                    2) echo "Oh you bet we are!... or at least I am, and I won't let you escape hehe."; pause; break 3 ;;
                    3) echo "...... uhhh she said you were weird but I sure wasn't expecting that lol. Well nice to meet you... Batman?"; pause; break 3 ;;
                    *) echo "Please choose 1, 2, or 3." ;;
                    esac
                done
            else
                echo "Please choose y or n."
            fi
        done
        ;;
    3)
        while true;do
            divider
            echo "You walk to the front row near the window, the sun shines through nicely"
            read -p "Gaze out the window (y/n)" answer
            if [ "$answer" = "y" ]; then 
                echo "Who are you? You're looking all mysterious."
                pause
                while true;do
                    divider
                    echo "You turn around quickly looking for the source of the sound, a girl is looking at you."
                    pause
                    echo "She puts her eyes on you patiently waiting for your response"
                    echo "1) I'm always mysterious, because I'm the boss around here."
                    echo "2) Oh really, I just thought it looked pretty nice out today so I was looking at the sky."
                    echo "3) uhhhhhh yea..."
                    echo "4)....."
                    read -p "(Choose 1, 2, 3, or 4)" choice 
                    case $choice in
                    1)  divider
                        change_umiko_affection -1
                        change_umiko_lie_meter 1
                        read -p "ehhhh was that supposed to be a joke? (y/n)" answer
                        while true;do
                            if [ "$answer" = "y" ]; then
                                change_umiko_affection 2
                                divider
                                echo "You sure are a jokester huh"
                                pause
                                echo "Well anyways I'm Yumehara Umiko I'll be sitting right behind you for the rest of this semster I look forward to working with you"
                                echo "Oh here comes the teacher I'll talk to ya later!"
                                break 4
                            elif  [ "$answer" = "n" ]; then
                                change_umiko_affection 1
                                echo "....."
                                echo "She turns her head and mumbles something quietly"
                                pause
                                echo "oh.. thats interesting.."
                                pause
                                echo "oh would you look at that our teacher is finaly here he.. he.."
                                pause
                                break 4
                            else 
                                echo "Please answer with either y or n"
                            fi
                        done
                        ;;
                    2) 
                        change_umiko_affection 1
                        divider
                        echo "It does look nice out now that I think about it"
                        pause
                        echo "She turns her head and looks out the window as well"
                        pause
                        echo "You sure are interesting"
                        pause
                        while true; do
                            echo "I'm Yumehara Umiko by the way"
                            echo "I look foward to working with you!"
                            divider
                            echo "1) me too! I'm $name, lets have a great year"
                            echo "2) Well I think your weird"
                            read -p "(choose 1 or 2)" choice
                            case $choice in
                            1) 
                                divider
                                change_umiko_affection 1
                                echo "A big smile flashes accross her face"
                                pause
                                echo "Look its the teacher! I'll talk to ya later!"
                                break 4
                                ;;
                            2)
                                divider
                                change_umiko_affection -1
                                echo "Your one to talk."
                                pause                                       
                                echo "Look here comes the teacher, I'll catch your name during intros I guess."
                                break 4
                                ;;
                            *) echo "Please choose 1 or 2."
                                ;;
                            esac
                        done
                        ;;
                    3)
                        divider
                        change_umiko_affection -2
                        echo "okkkk"
                        pause
                        echo "ummm well the teacher just got here so I'll talk to you another time."
                        break 3
                        ;;
                    4)
                        divider
                        change_umiko_affection -1
                        while true; do
                            divider    
                            echo "hello?"
                            echo "1) Oh sorry I didn't hear you."
                            echo "2) ......"
                            echo "3) I heard you the first time."
                            read -p "(Choose 1, 2, or 3)" choice
                            case $choice in
                            1) divider
                               echo "Oh no problem you must have been really absorbed in the view."
                               pause
                               echo "I'm Yumehara Umiko by the way I look forward to working with you!"
                               pause
                               echo "Look! the teachers coming I'll catch your name later!"
                               break 4
                               ;;
                            2)  divider
                                ignored_umiko=true
                                change_umiko_affection -2
                                echo "Oh so your just going to ignore me"
                                pause
                                echo "I'll remember this.."
                                break 4
                                ;;
                            3) divider
                               change_umiko_affection -3
                               echo "Wow sure wasn't expecting that, I guess my other seat mates will have to do."
                               break 4
                               ;;
                            *)
                                echo "Please choose 1, 2, or 3."
                                ;;
                            esac 
                        done
                        ;;
                    *)
                        echo "Please choose 1, 2, 3, or 4."
                        ;;
                    esac
                done
            elif [ "$answer" = "n" ]; then
                divider
                echo "Hello!"
                pause
                echo "You quickly turn around to the voice of a girl behind you"
                pause
                while true; do

                    echo "Hey I'm Yumehara Umiko I've never seen you around before!"
                    pause
                    echo "She looks at you and waits."
                    echo "1) Yea I don't really know anyone here."
                    echo "2) What I've been here forever."
                    echo "3) Thats because I've been avoiding you this whole time."
                    echo "4) I hide in the shadows so no one ever sees me I merely allowed you to see my greatness as a matter of curtesy."
                    read -p "(Choose 1,2,3, or 4)" choice
                    case $choice in
                    1)
                        divider
                        change_umiko_affection 1
                        echo "Well you know me atleast!"
                        pause
                        echo "Well maybe not alot but you will know me soon!"
                        while true; do

                            echo "So, do you think are teacher will be strict or fun?"
                            echo "1) I think they will be really fun"
                            echo "2) hmm I feel like I'm not lucky enough to get a fun teacher"
                            echo "3) I think they will be hella hot"
                            read -p "(Choose 1, 2, or 3)" choice
                            case $choice in
                            1) 
                                echo "Oh, I really hope your right!"
                                break
                                ;;
                            2) 
                                echo "Me neither, well hope our luck changes because I do not want to deal with yet another bad teacher."
                                break
                                ;;
                            3)
                                change_umiko_affection 1
                                echo "You sure your not just hoping they'll be hot, your an interesting guy huh!"
                                break
                                ;;
                            *) 
                                echo "Please choose 1, 2, or 3"
                                ;;
                            esac  
                        done
                        echo "Oh here comes the teacher time to know if our guesses were right or wrong, talk to ya later!"
                        break 3
                        ;;
                    2)
                        divider
                        change_umiko_lie_meter 1
                        echo "really?"
                        pause
                        echo "Wow? I thought I would have seen you around by now, sorry for not noticing you all his time."
                        pause
                        echo "Well atleast I noticed you now! So lets have a great year moving forward"
                        pause
                        while true; do

                            divider
                            echo "Oh and I didn't quite catch your name."
                            echo "she lays back in her chair and looks at you"
                            echo "1) I'm $name nice to meet you!"
                            echo "2) I'm Yumehara Umiko"
                            echo "3) You'll figure out my name later"
                            read -p "(Choose 1, 2, or 3)" choice
                            case $choice in
                            1)
                                divider
                                echo "Nice to meet you too!"
                                pause
                                echo "Oh look the teachers here, hope shes fun!"
                                pause
                                echo "Talk to ya later!"
                                break 4
                                ;;
                            2)
                                divider
                                change_umiko_lie_meter 1
                                change_umiko_affection 1
                                echo "What I'm Yumehara Umiko."
                                echo "mmm whatever I'll catch your name later here comes the teacher."
                                break 4
                                ;;
                            3) 
                                divider
                                change_umiko_affection -1
                                echo "mmm alright.."
                                echo "Well the teacher just got here so talk to ya another time"
                                break 4
                                ;;
                            *) 
                                echo "Please choose 1, 2, or 3"
                                ;;
                            esac
                        done
                        ;;
                    3)
                        divider
                        change_umiko_affection -3
                        echo "Wow, thought I might try and get to know you but I guess you don't feel the same."
                        echo "She turns around and starts talking to someone else"
                        break 3
                        ;;
                    4)
                        divider
                        change_umiko_affection 2
                        echo "Haha your weird, I think we'll be great friends!"
                        pause
                        echo "Please don't hide in the shadows anymore though, it'd be kinda incovenient if I can't see you lol."
                        while true; do

                            divider
                            echo "Oh and I didn't quite catch your name."
                            echo "she lays back in her chair and looks at you"
                            echo "1) I'm $name nice to meet you!"
                            echo "2) I'm Yumehara Umiko"
                            echo "3) You'll figure out my name later"
                            read -p "(Choose 1, 2, or 3)" choice
                            case $choice in
                            1)
                                divider
                                echo "Nice to meet you too!"
                                pause
                                echo "Oh look the teachers here, hope shes fun!"
                                pause
                                echo "Talk to ya later!"
                                break 4
                                ;;
                            2)
                                divider
                                change_umiko_lie_meter 1
                                change_umiko_affection 1
                                echo "What I'm Yumehara Umiko."
                                echo "mmm whatever I'll catch your name later here comes the teacher."
                                break 4
                                ;;
                            3) 
                                divider
                                change_umiko_affection -1
                                echo "mmm alright.."
                                echo "Well the teacher just got here so talk to ya another time"
                                break 4
                                ;;
                            *) 
                                echo "Please choose 1, 2, or 3"
                                ;;
                            esac
                        done
                        ;;
                    *)
                        echo "Please choose 1, 2, 3, or 4"
                        ;;
                    esac
                done
            else
                echo "Please choose y or n"
            fi
        done
        ;;
    4)
        divider
        echo "You walk over to the seat near the door and look around."
        pause
        echo "there doesn't appear to be much talkative people there."
        pause
        echo "You sit down and turn to your seatmates, one of them, the one directly behind you has a stack of manga on his table and has his nose in his book"
        pause
        echo "The other one to your left is laying back in his chair, his eyes are closed and he lookes really relaxed"
        pause
        echo "You look around to see if there is anyone else but all you see is a baren empty desk located to your back left, hopefully someone interesting will choose to sit there."
        while true; do
            echo "1) Talk to the guy behind you with all the mangas."
            echo "2) Wake up the guy next to you."
            echo "3) Do nothing"
            echo "4) Set up a prank for when the teacher walks in"
            read -p "(Choose 1, 2, 3, or 4)" choice
            case $choice in
            1)
                echo "You turn around \"What you reading?\" You say to the kid behind you."
                echo "Uhh I'm reading manga. Why do you ask.. "
                echo "1) Well I know your reading manga but which one, I'm a big fan too."
                echo "2) You know what nvm."
                echo "3) I was wondering if you had any doujinshi."









         



         ;;
     *)
        echo "Please choose 1, 2, 3, or 4."
        ;;
    esac
done