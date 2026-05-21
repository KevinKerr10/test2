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
kei_affection=0
kei_lie_meter=0
reputation=0
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
change_umiko_lie_meter() { umiko_lie_meter=$((umiko_lie_meter + $1)); }
change_kirky_affection() { kirky_affection=$((kirky_affection + $1)); }
change_kirky_lie_meter() { kirky_lie_meter=$((kirky_lie_meter + $1)); }
change_kei_affection() { kei_affection=$((kei_affection + $1)); }
change_kei_lie_meter() { kei_lie_meter=$((kei_lie_meter + $1)); }
change_reputation() { reputation=$((reputation + $1)); }
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
        chose_seat1=true
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
        chose_seat2=true
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
        chose_seat3=true
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
        chose_seat4=true       
        divider
        echo "You walk over to the seat near the door and look around."
        pause
        echo "there doesn't appear to be much talkative people there."
        pause
        echo "You sit down and turn to your seatmates, one of them, the one directly behind you has a stack of manga on his table and has his nose in his book"
        pause
        echo "The other one to your left is laying back in her chair, her eyes are closed and she lookes really relaxed"
        pause
        while true; do
            divider
            echo "You look around to see if there is anyone else but all you see is a baren empty desk located to your back left, hopefully someone interesting will choose to sit there."
            pause
            if [ "$talked_to_kirky" = true ]; then
                echo "You've already talked to the kid with the manga, but the teacher isn't here yet so you wonder what you'll do all over again."           
                pause
            fi
            echo "1) Talk to the guy behind you with all the mangas."
            echo "2) Wake up the girl next to you."
            echo "3) Wait for teacher."
            echo "4) Set up a prank for when the teacher walks in."
            read -p "(Choose 1, 2, 3, or 4)" choice
            case $choice in
            1)
                divider
                echo "You turn around \"What you reading?\" You say to the kid behind you."
                while true; do
                    divider
                    echo "Uhh I'm reading manga. Why do you ask.. "
                    echo "1) Well I know your reading manga but which one, I'm a big fan too."
                    echo "2) You know what nvm."
                    echo "3) I was wondering if you had any doujinshi."
                    read -p "(Choose 1, 2, or 3)" choice
                    case $choice in 
                    1) 
                       divider
                       echo "Oh you don't look like a fan of manga."
                       pause
                       echo "Well I'm reading Anya sometimes hides her feelings in english"
                       pause
                       echo "And its pretty interesting so I'm going to keep reading..."
                       break
                       talked_to_kirky=true
                       ;;
                    2)
                        change_kirky_affection -1
                        divider
                        echo "Ok I'm going to keep reading than"
                        break
                        talked_to_kirky=true
                        ;;
                     3)
                        change_kirky_affection 5
                        divider
                        echo "His eyes perk up"
                        pause
                        echo "\"It seems I may have found myself a comrade.\""
                        pause
                        echo "\"My name is Kirky Chudstein I think we'll be great friends.\""
                        pause
                        echo "\"Oh here comes the teacher, I'll show you the goods later.\""
                        break 3
                        ;;
                    *)
                        divider
                        echo "Please choose 1, 2, or 3"
                        ;;
                    esac
                done
                ;;
            2)        
                divider
                echo "You turn to the girl next to you, she looks pretty cozy but you decide to wake her up anyways.."
                pause
                echo "\"mmm did someone tap my shoudler.\" she says while yawning."
                pause
                echo "\"Yeah I tapped your shoulder.\" you say."
                pause
                echo "\"I was having a good sleep you know.\" She mentions while slowly getting up and stretching."
                pause 
                while true; do
                    divider
                    echo "\"So why'd you wake me up?\" she looks in your direction and lays her head on her desk while waiting."
                    echo "1) The teacher will come any minute now so I wanted to save you before they call you out infront of everyone."
                    echo "2) You just looked so comfortable I felt like disturbing the peace."
                    echo "3) I'm pretty bored so I wanted to see if I could get to know my seatmates better."
                    read -p "(Choose 1, 2, or 3)" choice 
                    case $choice in 
                    1) 
                        divider
                        change_kei_affection 3
                        echo "\"Oh yea I'm at school thanks for reminding me, that would have been embarrassing.\""
                        pause 
                        echo "\"I'm Kanashiro Kei by the way, please help me in the future as well I tend to be treally tired at school.\" she says while yawning again."
                        pause
                        echo "\"Oh here comes the teacher, I guess she really was coming soon.\" She observes."
                        break 3
                        ;;
                    2)
                        divider
                        change_kei_affection -2
                        echo "\" ehhhhh that was a really nice dream I was in.\" She says while the light slowly dies out from here eyes."
                        pause
                        echo "\" well don't do it again then or umm... I.. I'll hate you.\" She stutters."
                        pause
                        echo "\" Ok well then ima go back to sleep than.\" She yawns."
                        break 
                        ;;
                    3)
                        divider
                        change_kei_affection 1
                        echo "\" Oh thats nice I guess I could get to know you before the teacher gets here.\" She say clearly tired."
                        pause
                        echo "\" I'm Kanashiro Kei I guess, uh.. My hobbies are napping, dreaming, mmm.. and I guess reading books in the library.\" She says, with her voice cleaerer than last time."
                        pause 
                        echo "\" And you are?\" She asks you, while calmly laying back."
                        while true; do
                            divider
                            read -p "Tell her your name? (y/n)" answer
                            if [ "$answer" = "y" ]; then
                                divider
                                change_kei_affection 1                           
                                echo "\"I'm $name, nice to meet you Kanashiro.\" You respond."
                                pause
                                echo "\"Oh yea nice to meet you.\" She mumurs."
                                break
                            elif [ "$answer" = "n" ]; then
                                divider
                                echo "\"I want to keep it a surprise for introductions\" You answer."
                                pause
                                echo "\" Mmmm alright, hope I'm not asleep during intros.\"She says lightly."
                                break
                            else 
                                divider
                                echo "Please choose y or n."
                            fi
                        done
                        echo "\"Oh look I managed to stay awake unitl the teacher got here, talk to you another time!\" She says smiling."
                        break 3
                        ;;
                    *)
                        divider
                        echo "Please choose 1, 2, or 3."
                        ;;
                    esac
                done       
                ;;
            3)
                divider
                echo "After a bit you see the teacher and stop what your doing."
                break 2
                ;;    
            4)
                divider
                echo "You look around, you know what must be done you see the door, you see what you've got its all set."
                pause
                echo "You get up and set up the prank at the door everyone is looking at you."
                pause
                echo "You quickly finish and rush back to your seat and wait for the teacher to arrive."    
                set_prank=true
                break 2
                ;;
            *)    
                echo "Please choose 1, 2, 3, or 4."
                ;;
            esac
        done
        ;;
    *)
        echo "Please choose 1, 2, 3, or 4."
        ;;
    esac
done
echo "Everyone turns there heads the sound of the door opening rings through the classroom and everyone goes quiet"
if [ "$set_prank" = true ]; then
    echo "Looks of all kinds flash accross everyones faces as they realize whats about to unfold."
    pause
    echo "The teacher slides the door open and takes the first step in the class."
    pause
    echo "As if in slow motion exactly the way you pictured it the bucket full of pencil shavings above the door falls down."
    pause
    echo "Everyone watches each instant slowly, until finally.."
    pause
    echo "The bucket fell straight on the teachers head, and a loud clank sound reverberates throguh the classroom"
    pause
    echo "But for some reason diverging from everyones expecations, the teacher doesn't look surprised, she looks in your diretion."
    pause
    divider
    echo "Everyone looks at you."
    pause
    echo "The teacher sighs."
    pause
    echo "\"Cant say I didn't expect this, I'll let you get off this time but next time you won't be so lucky.\" She says to you with a small smile on her face."
    pause
    echo "While all the chaos unfolded all you could think to yourself was, how the hell did she know it was me."
    pause
    echo "The teacher brushes off the penicl shavings and gets back to business."
    pause
    echo "\" Now that thats dealth with, lets get class started.\" she calmly anounces with not a hint of anger on her face."
    divider
fi
echo "The teacher walks to the front of the classroom and begins to speak."
echo "\"Hello everyone I'm Ms. Kobayashi and I'll be your homeroom teacher for the rest of year, I look forward to wroking with you all!\""
echo "\"Enough of my introductions though I believe its time you all introduce your selves to everyone, lets begin with the back corner near the window.\""
if [ "$chose_seat1" = true ]; then
    while true; do
        intro_done=true
        divider
        echo "Wait a minute thats you, introduce yourself everyones eyes are on you, awaiting what the first person will say, what kind of first impression will you make?"
        echo "1) Hello, everyone I'm $name, I love playing sports of all kinds and getting to know new people, I look forward to a great year with you all!"
        echo "2) Uh.. I'm $name I like watching anime.. and gooning!...."
        echo "3) ...... I'm $name"
        echo "4) As you may already know I'm batman, I lurk in the shadows, and protect the light."
        read -p "(Choose 1, 2, 3, or 4)" choice 
        case $choice in
        1)
            change_reputation 3
            divider
            echo "Everyone turns to you and responds\"Nice to meet you too! Many students all over the class reply\""
            if [ "$arima_affection" > 0 ]; then
                echo "Your new friend Arima turns to you as well and smiles,\"Hey that was a pretty strong intro\" He comments while smiling at you."
            else 
                change_arima_affection -2
                echo "Your seamate Arima turns to you,\"Wow what'd I do to harbor such a negative response from you when your like you gave me.\" He murmurs."
            fi
            break
            ;;
        2) 
            change_reputation -4
            echo "Everyone instantly turns there heads and a couple of them even give you looks of disgust. For some reason one guy near the front corner starts smirking, but everyone else didn't seem to find what you said very funny."
            pause
            echo "\"uhh what a weirdo.\"You hear some girls whisper."
            pause           
            echo "It would seem that this isn't going to be easy to recover from."
            if [ "$arima_affection" > 0 ];then 
                echo "Even Arima your new friend looks at you with surprise on his face."
            fi
            break
            ;;
        3)
            change_reputation -1
            divider
            echo "The class goes silent, and you sit back down quickly"
            if [ "$arima_affection" > 0 ];then
                echo "Arima turns to you right after you sit down and begins to speak"
                pause
                echo "\"Not the way you wanted that to turn out huh!\"He says chuckling softly"
            fi
            break
            ;;
        4)
            change_reputation 2
            divider
            echo "An awkward silence blankets the room."
            pause
            echo "3 seconds go by."
            pause
            echo "Half the people are trying there hardest not to laugh, the other half is already laughing."
            if [ "$arima_affection" > 0 ];then
                echo "Your funnier than I though huh!"
            fi
            echo "\"Alright class settle down\"The teacher interjects."
            break
            ;;
        *) echo "Please choose 1, 2, 3, or 4."
           ;;
        esac
    done
else









