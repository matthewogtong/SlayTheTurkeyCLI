require "tty-prompt"
require "tty-font"
require "tty-table"
require "pastel"
require "pry"


class CLI
    
    @@prompt = TTY::Prompt.new
    @@user = nil
    @@current_game = nil
    @@font = TTY::Font.new(:doom)
    @@character = nil

    # table_emojis = [🪓", "🦆", "👨‍🌾", "🧝‍♀️", " 🥔", " 🦾", " 🦿", "🌿", "🐇", "🍄", "🗡️"]

    #ASCII ART ---------------------------------------------------------------

    def self.rabbit_ascii
        a_art = <<-HRD
        *             +      / |   ,-~ /             +
     .              Y :|  //  /                .         *
         .          | jj /( .^     *
               *    >-`~`-v`              .        *        .
*                  /       Y
   .     .        jo  o    |     .            +
                 ( ~T~     j                     +     .
      +           >._-' _./         +
               /| ;-`~ _  l
  .           / l/ ,-`~    \     +
              \//\/      .- \
       +       Y        /    Y
               l       I     !
               ]\      _\    /`\
              (` ~----( ~   Y.  )
          ~~~~~~~~~~~~~~~~~~~~~~~~~~"
                    HRD
        


        puts a_art

    end
    
    def self.boar_ascii
        a_art = <<-HRD
        _,-````-..__
        |`,-`_. `  ` ``  `--`````.
        ;  ,`  | ``  ` `  ` ```  `.
      ,-`   ..-` ` ` `` `  `` `  ` |``.
    ,`    ^    `  `    `` `  ` `.  ;   \
   `}_,-^-   _ .  ` ' `  ` __ `   ;    @
      `"---"' `-`. ` '---```.`.  `;
                 ''` ;       ; `. `,
                  ||`;      / / | |
                 //_;`    ,_;' ,_;`
        HRD

        puts a_art
    end

    def self.turkey_ascii
        a_art = <<-HRD 
                                      ____
                                      :    :
                  ___                 :____:
          ___ ---\ ~~ /---___         :  []:
          \   \ ~ \~ /~~~/~~~/     ----,-------
        ,' \~~ \~~ \/ ~~/~~~/ `,     ,'  0 0 __
       -_~~ \   \,------,  / ~ _`    ;    _____\
      ;   - _ \,'^^^^^^^ ""`,_-  \   `, `--'; u
      ; ~~   ,'^^^^-----------   /   ,'`,,,'
      ;~ ---, ^^^,`__----,  ..`,/  ,'..,'
      `,  ~ ,^^ <_'__--__ `, .. `,/ .. `
       `,---` ^<________--  `, .. ..  ,'     ___ [] ___
        `,---` <__ -__ ___  ,' .. . ,`     _/   \)(/   \_
         `, --` <__ __ _  ,' ... _,`      /   /      \   \
          `--,___<___   ,'`-___,'       ,'   :   |        `,
                  <___,'(||)            :             :    :
                    ||   ||             :    :   |         ;
                  __||_ _||_            \_            :   _/
                 // ;;\\ ;;\\             \_  \  |   /  _/
                ~~     ~~   ~~              \__________/
              HRD

        puts a_art

    end

    def self.duck_ascii
        a_art = <<-HRD
        
                ,~&.
        (\_   (  e )>
         ) `~~'   (
        (   `-._)  )
         `-._____,'  
         HRD

         puts a_art
    end

    def self.mushroom_ascii
        a_art = <<-HRD
        
        _,--'----'-'-'-   
      ,'.  .            \
    ,/:. .     .       .'
    |;..  .      _..--'
    `--:...-,-'""\
            |:.  `.
            l;.   l
            `|:.   |
             |:.   `.,
            .l;.    j, ,
         `. \`;:.   //,/
          .\\)`;,|\'/(
        HRD

        puts a_art
    end

    def self.potato_emojis
        puts "🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔" * 100
    end

    def self.bionic_leg_ascii
        a_art = <<-HRD
      
        \__/     /  \     /  \     \__/
        |  |     ||||     ||||     |  |
        |==|     ||||     ||||     |==|
                 ||||     ||||
                 ||||     ||||
                 \__/     \__/
                 /  \     /  \
                 ||||     ||||
                 ||||     ||||
                 ||||     ||||
               ,/|__|\   /|__|\,     
              /--|__|-\ /-|__|--\
             |___|  |_| |_|  |___|
        HRD

        puts a_art
    end

    def self.axe_ascii
        a_art = <<-HRD
                          _,,--.._
                    /. ` ` .  `.
                    )|       `  `.
       .           / |         `  `
        `.        / /            ` `
         `.`.    / /              ` `
           `.`.'' /                ' :
            <','/'`                . ;
           ,-'.-    `             , /
       _.-',-^`       `      _.-----
 /`==::.,-'     `       ` ,-'
/ /               `     .;
| |..               ` .,' `.
| ':`....---.       ,'`'.   `.
 .`:.:.:.:.:-..    /     `.   `.
  .`ccoccoccoc'``./        `.   `.
   `.`CQCCQCCCQCC/           `.   `.
     `.`8O8O8O8O8(             `.   `.
       `.`_-_@-@_-;              `. .'"'.
            '""'                   :,' ,--'
                                    `.` _,--
             A                        `.  _,',.
            (@)                         `. .-' `_
                                          `. ,-^.`.
               A                            `. - _.-.
              (@)                             `.', ,'-
                                                `. _,-`__
                                                  `. _-,`|
                                                    |,_-`|
                                                    '----'
        HRD

        puts a_art
    end

    def self.strange_plant_ascii
        a_art = <<-HRD
                  |
                 |.|
                 |.|
                |\./|
                |\./|
.               |\./|               .
 \^.\          |\\.//|          /.^/
  \--.|\       |\\.//|       /|.--/
    \--.| \    |\\.//|    / |.--/
     \---.|\    |\./|    /|.---/
        \--.|\  |\./|  /|.--/
           \ .\  |.|  /. /
 _ -_^_^_^_-  \ \\ // /  -_^_^_^_- _
   - -/_/_/- ^_^/| |\^_^ -\_\_\- -
             /_ / | \ _\
                  |
        HRD

        puts a_art
    end

    def self.bionic_arm_ascii
        a_art = <<-HRD
        |_|_|
        |_|_|              _____
        |_|_|     ____    |*_*_*|
_______   _\__\___/ __ \____|_|_   _______
/ ____  |=|      \  <_+>  /      |=|  ____ \
~|    |\|=|======\\______//======|=|/|    |~
|_   |    \      |      |      /    |    |
\==-|     \     |  2D  |     /     |----|~~/
|   |      |    |      |    |      |____/~/
|   |       \____\____/____/      /    / /
|   |         {----------}       /____/ /
|___|        /~~~~~~~~~~~~\     |_/~|_|/
 \_/        |/~~~~~||~~~~~\|     /__|\
 | |         |    ||||    |     (/|| \)
 | |        /     |  |     \       \\
 |_|        |     |  |     |
        HRD

        puts a_art
    end

    def self.win_game_ascii
        a_art = <<-HRD
        .----------------------------------------------------------.
        |                 "Eat the other White Meat"                |
        |                __ __  ___  _____ _____ _  _               |
        |                ||=|| ||=|| ||_// ||_// \\//               |
        |                || || || || ||    ||     //                |
        |____ __ __  ___  __ __ __ __ __ ___  __ __ __ __ __ __ ___ |
        | ||  ||=|| ||=|| ||\|| ||<< (( (( __ || \\ // || ||\||(( __|
        | ||  || || || || || \| || \\_)) \\|| ||  \V/  || || \| \\|||
        |                                                           |
        '._________________________________________________________.'
           ,      \            .-""-._  | |
           |'.    |\   ;.     /   _ .-\ | |
     _     |  '.  | \  | '    |  ( o_O || |
     \'-._ ;    \ |  ; '  \   \  `-/ `\/| |
      \   'f     '|  '\|   ; /.`.__'  L | |
       \    `\    ;    Y   |/ |  / | />)| |
  _     ;     l   '     ;  |  | / /|/(< | |
 `\'`'-._\     \   ;    |  ' .'/ |    )|| |
   \     '-\    \   \  '__'_.-'  L   (_/| |
    `.      `.   `._.-'"'``       '.   _| |
,.-'"-.'.      `. ,"`                \"` |/`\
'.      `'-._   7             "-._   \  |\_ |
  `'-.__     '-'    ;             `-..|_|_|~
  __,-'"'--.._'      \                     \
._'           /        \                , _.`
  '"'--;-''"<          `|\             _\ |
  _.-'`   _;|             `"-.,___\--'' | |
 `'-.,__..'  \                          | |
       .'   .'.                         | |
      /..-'`   \                      _/| |
         /    .'7_                 _,'  | |
        ;   ./   ;`'-,,_    ___.,-'"`mx | |
        |_.';   /  |  \ \  | |  |       | |
            |.-';  ;  '  ~~   ~~        | |
                 \' \/   ||   ||        | |
                         ||  _||__      | |
                     _.-" '`"--.._'-._  | |
                    r"-.,-''""---.\"-.\ |_|
        HRD

        puts a_art
    end

    def self.game_lose_ascii
        a_art = <<-HRD
                                            .""--..__
                     _                     []       ``-.._
                  .'` `'.                  ||__           `-._
                 /    ,-.\                 ||_ ```---..__     `-.
                /    /:::\\               /|//}          ``--._  `.
                |    |:::||              |////}                `-. \
                |    |:::||             //'///                    `.\
                |    |:::||            //  ||'                      `|
        jgs     /    |:::|/        _,-//\  ||
        hh     /`    |:::|`-,__,-'`  |/  \ ||
             /`  |   |'' ||           \   |||
           /`    \   |   ||            |  /||
         |`       |  |   |)            \ | ||
        |          \ |   /      ,.__    \| ||
        /           `         /`    `\   | ||
       |                     /        \  / ||
       |                     |        | /  ||
       /         /           |        `(   ||
      /          .           /          )  ||
     |            \          |     ________||
    /             |          /     `-------.|
   |\            /          |              ||
   \/`-._       |           /              ||
    //   `.    /`           |              ||
   //`.    `. |             \              ||
  ///\ `-._  )/             |              ||
 //// )   .(/               |              ||
 ||||   ,'` )               /              //
 ||||  /                    /             || 
 `\\` /`                    |             // 
     |`                     \            ||  
    /                        |           //  
  /`                          \         //   
/`                            |        ||    
`-.___,-.      .-.        ___,'        (/    
         `---'`   `'----'`
        HRD

        puts a_art
    end

    def self.forest_ascii
        a_art = <<-HRD
                     ___
                _,-'""   """"`--.
             ,-'          __,,-- \
           ,'    __,--""""dF      )
          /   .-"Hb_,--""dF      /
        ,'       _Hb ___dF"-._,-'
      ,'      _,-""""   ""--..__
     (     ,-'                  `.
      `._,'     _   _             ;
       ,'     ,' `-'Hb-.___..._,-'
       \    ,'"Hb.-'HH`-.dHF"
        `--'   "Hb  HH  dF"
                "Hb HH dF
                 "HbHHdF
                  |HHHF
                  |HHH|
                  |HHH|
                  |HHH|
                  |HHH|
                  dHHHb
                .dFd|bHb.               o
      o       .dHFdH|HbTHb.          o /
\  Y  |  \__,dHHFdHH|HHhoHHb.__Krogg  Y
##########################################

        HRD

        puts a_art
    end

    def self.marshlands_ascii
        a_art = <<-HRD
        .        +          .      .          .
        .            _        .                    .
     ,              /;-._,-.____        ,-----.__
    ((        .    (_:#::_.:::. `-._   /:, /-._, `._,
     `                 \   _|`"=:_::.`.);  \ __/ /
                         ,    `./  \:. `.   )==-'  .
       .      ., ,-=-.  ,\, +#./`   \:.  / /           .
   .           \/:/`-' , ,\ '` ` `   ): , /_  -o
          .    /:+- - + +- : :- + + -:'  /(o-) \)     .
     .      ,=':  \    ` `/` ' , , ,:' `'--".--"---._/`7
      `.   (    \: \,-._` ` + '\, ,"   _,--._,---":.__/
                 \:  `  X` _| _,\/'   .-'
   .               ":._:`\____  /:'  /      .           .
                       \::.  :\/:'  /              +
      .                 `.:.  /:'  }      .
              .           ):_(:;   \           .
                         /:. _/ ,  |
                      . (|::.     ,`                  .
        .                |::.    {\
                         |::.\  \ `.
                         |:::(\    |
                 O       |:::/{ }  |                  (o
                  )  ___/#\::`/ (O "==._____   O, (O  /`
             ~~~w/w~"~~,\` `:/,-(~`"~~~~~~~~"~o~\~/~w|/~
   dew   ~~~~~~~~~~~~~~~~~~~~~~~\\W~~~~~~~~~~~~\|/~~
        HRD

        puts a_art
    end
    #---------------------------------------------------------------
    @@table_boar = TTY::Table.new do |t|
        t << ["5th Path", "🐗", "🐗"]
        t << ["4th Path", "🦿", " 🥔"]
        t << ["3rd Path", "🦆", "🪓"]
        t << ["2nd Path", "🐇", "🪓"]
        t << ["1st Path", "🍄", "🦆"]
    end
    @@table_turkey = TTY::Table.new do |t|
        t << ["5th Path", "🦃", "🦃"]
        t << ["4th Path", "🌿", "🦾"]
        t << ["3rd Path", "🦆", "🍄"]
        t << ["2nd Path", "🪓", "🦆"]
        t << ["1st Path", "🐇", "🪓"]
    end
    #-----------------------------------------------------------------
    def run
        system('clear')
        CLI.main_menu
    end

    def self.logo
        # self.turkey_ascii
        puts @@font.write("SLAY THE TURKEY", letter_spacing: 2)
    end

     #MAIN MENU --------------------------------------------------------- 

    def self.main_menu
        system('clear')
        self.logo
        choice = @@prompt.select("Choose an Option") do |p|
            p.choice "Log In"
            p.choice "Create User"
            p.choice "Delete User"
            p.choice "Manual"
        end
        case choice
        when "Log In"
            self.login
        when "Create User"
            self.create_user
        when "Delete User"
            self.delete_user
        when "Manual"
            self.manual
        end
    end #main_menu

    def self.login
        system('clear')
        self.logo
        choice = @@prompt.select("Choose an Option") do |p|
            p.choice "Login"
            p.choice "Main Menu"
        end 
        case choice
        when "Login"
            username = @@prompt.ask("Username:")
            password = @@prompt.mask("Password:")
            @@user = User.find_by(username: username, password: password)
            if @@user 
                system('clear')
                self.select_character
            else
                system('clear')
                self.logo
                puts "Invalid Username or Password!"
                sleep(3)
                self.login
            end
        when "Main Menu"
            CLI.main_menu
        end 
    end #login

    def self.create_user
        system('clear')
        self.logo
        choice = @@prompt.select("Choose an Option") do |p|
            p.choice "Create User"
            p.choice "Main Menu" 
        end 
        case choice
        when "Create User"
            username = @@prompt.ask("Username:")
            password = @@prompt.mask("Password:")
            User.create(username: username, password: password)
            puts "#{username} has been created!"
            sleep(3)
            system('clear')
            CLI.main_menu
        when "Main Menu"
            CLI.main_menu
        end 
    end #create_user
    
    def self.delete_user
        system('clear')
        self.logo
        choice = @@prompt.select("Choose an Option") do |p|
            p.choice "Delete User"
            p.choice "Main Menu"
        end 
        case choice
        when "Delete User"
            system('clear')
            self.logo
            username = @@prompt.ask("Username:")
            password = @@prompt.mask("Password:")
            User.all.select do |user| 
                # binding.pry
                if user.username == username && user.password == password
                    User.destroy(user.id)
                    puts "User Deleted!"
                    sleep(3)
                    CLI.main_menu
                end
            end 
            puts "Invalid username or password!"
            sleep(3)
            system('clear')
            CLI.main_menu
        when "Main Menu"
            CLI.main_menu
        end 
    end #delete_user

    def self.manual
        system('clear')
        self.logo
        choice = @@prompt.select("Choose an Option") do |prompt|
            prompt.choice "View User Manual"
            prompt.choice "Go Back to Title Screen"
        end
        case choice
        when "Go Back to Title Screen"
            self.main_menu
        when "View User Manual"
            system('clear')
            self.logo
            puts "The game consists of two levels and five path choices per level." 
            puts "Move through both levels, choosing a path at each choice."
            puts "Defeat the obstacles in your way to secure your family's well-being in the New World!"
            puts "Happy Thanksgiving!"
            choice = @@prompt.select("Choose an Option") do |prompt|
                prompt.choice "Go Back to Title Screen"
            end
            case choice
            when "Go Back to Title Screen"
                self.main_menu
            end
        end
    end #manual
    

    def self.select_character
        system('clear')
        self.logo
        choice = @@prompt.select("Choose a Character") do |p|
            p.choice "👨‍🌾 Thomas Smith"
            p.choice "🧝‍♀️ Elizabeth Holmsworth"
            p.choice "🧙‍♂️ Beardy McBeardson"
        end
        case choice
        when "👨‍🌾 Thomas Smith"
            thomas = Character.create({name: 'Thomas Smith', power: 5, hp: 10})
            @@current_game = Game.create({move_count: 0})
            @@current_game.character = thomas
            @@character = @@current_game.character.name
            @@current_game.user = @@user
            thomas.save
            @@current_game.save
            self.game_start
        when "🧝‍♀️ Elizabeth Holmsworth"
            liz = Character.create({name: 'Elizabeth Holmsworth', power: 3, hp: 10})
            @@current_game = Game.create({move_count: 0})
            @@current_game.character = liz
            @@character = @@current_game.character
            @@current_game.user = @@user
            liz.save
            @@current_game.save
            self.game_start
        when "🧙‍♂️ Beardy McBeardson"
            beard = Character.create({name: 'Elizabeth Holmsworth', power: 15, hp: 5})
            @@current_game = Game.create({move_count: 0})
            @@current_game.character = beard
            @@character = @@current_game.character
            @@current_game.user = @@user
            beard.save
            @@current_game.save
            self.game_start
        end
    end

    #Game Components -----------------------------------------------------
    # def self.game_header(level)
    #     puts @@font.write("#{level}", letter_spacing: 2)
    # end
    
    def self.game_map_first_level
        system('clear')
        self.forest_ascii
        puts @@font.write("THE FOREST", letter_spacing: 2)
        self.forest_ascii
        puts @@table_boar.render(:ascii, padding: 2)
    end

    def self.game_map_second_level
        system('clear')
        self.marshlands_ascii
        puts @@font.write("MARSHLANDS", letter_spacing: 2)
        puts @@table_turkey.render(:ascii, padding: 2)
    end

    def self.game_start
        system('clear')
        puts "You are now entering the Wooded Forest..."
        sleep(2)
        system('clear')
        self.level_first_choice
    end

    def self.proceed_option
        choice = @@prompt.select("What would you like to do next?") do |p|
            p.choice "Proceed"
            p.choice "Check Stats"
            p.choice "Exit to Main Menu (Warning - You will lose all progress)"
        end
        case choice
        when "Proceed"
            if @@current_game.move_count == 1
                self.level_second_choice
            elsif @@current_game.move_count == 2
                self.level_third_choice
            elsif @@current_game.move_count == 3
                self.level_fourth_choice
            elsif @@current_game.move_count == 4
                self.second_level_first_choice
            elsif @@current_game.move_count == 5
                self.second_level_second_choice
            elsif @@current_game.move_count == 6
                self.second_level_third_choice
            elsif @@current_game.move_count == 7
                self.second_level_fourth_choice
            end
        when "Check Stats"
            puts "Your character has #{@@current_game.character.hp} HP and #{@@current_game.character.power} Strength."
            second_choice = @@prompt.select("What would you like to do next?") do |p|
                p.choice "Proceed"
            end
            case second_choice
            when "Proceed"
                if @@current_game.move_count == 1
                    self.level_second_choice
                elsif @@current_game.move_count == 2
                    self.level_third_choice
                elsif @@current_game.move_count == 3
                    self.level_fourth_choice
                elsif @@current_game.move_count == 4
                    self.second_level_first_choice
                elsif @@current_game.move_count == 5
                    self.second_level_second_choice
                elsif @@current_game.move_count == 6
                    self.second_level_third_choice
                elsif @@current_game.move_count == 7
                    self.second_level_fourth_choice
                end
            end
        when "Exit to Main Menu (Warning - You will lose all progress)"
            system('clear')
            self.logo
            puts "You lose all standing in your family and are sent back to England!"
            sleep(3)
            self.main_menu
        end
    end

    def self.only_proceed_option
        choice = @@prompt.select("Time to push onward.") do |p|
            p.choice "Proceed"
        end
        case choice
        when "Proceed"
            if @@current_game.move_count == 1
                self.level_second_choice
            elsif @@current_game.move_count == 2
                self.level_third_choice
            elsif @@current_game.move_count == 3
                self.level_fourth_choice
            elsif @@current_game.move_count == 4
                self.second_level_first_choice
            elsif @@current_game.move_count == 5
                self.second_level_second_choice
            elsif @@current_game.move_count == 6
                self.second_level_third_choice
            elsif @@current_game.move_count == 7
                self.second_level_fourth_choice
            end
        end
    end

    #Path Options-------------------------------------------------------------------------------

    def self.power_up_path
        system('clear')
        self.axe_ascii
        puts "You come across an axe lying on the ground. Huzzah!"
        puts "You grab the axe and feel your Strength grow..."
        puts "Your Strength increases by 2"
        sleep(2)
        @@current_game.character.power += 2
        self.proceed_option
    end

    def self.mushroom
        system('clear')
        self.mushroom_ascii
        puts "You come across a delicious looking mushroom, you are inclined to eat it."
        puts "You see strange shapes and colors - you're hallucinating!"
        puts "You lose 4 Strength"
        sleep(3)
        @@current_game.character.power -= 4
        self.proceed_option
    end

    def self.rabbit
        system('clear')
        self.rabbit_ascii
        puts "You come across a seemingly harmless rabbit."
        puts "It claws your face and you lose 3 HP!"
        sleep(3)
        @@current_game.character.hp -= 3
        if @@current_game.character.hp < 1
            self.game_lose
        else
            self.only_proceed_option
        end
    end

    def self.potato_path
        system('clear')
        self.potato_emojis
        puts "A field of wild Potatoes, you're very hungry... eat it!"
        puts "You gain 3 HP!"
        sleep(5)
        @@current_game.character.hp += 3
        self.boar_fight
    end
    
    def self.bionic_leg
        system('clear')
        self.bionic_leg_ascii
        puts "You come across a glow from within the forest - suddenly and without warning, your leg is replaced with some foreign parts... it feels strong!"
        puts "You gain 5 Strength!"
        sleep(7)
        @@current_game.character.power += 5
        self.boar_fight
    end

    def self.strange_plant
        system('clear')
        self.strange_plant_ascii
        puts "A green herb grows from the ground... this may be suitable in my pipe..."
        puts "You gain 4 Stregnth!"
        sleep(6)
        @@current_game.character.power += 4
        self.turkey_fight
    end

    def self.bionic_arm
        system('clear')
        self.bionic_arm_ascii
        puts "You come across a glow from within the forest - suddenly and without warning, your arm is replaced with some foreign parts... it feels strong!"
        puts "You gain 5 Stregnth!"
        sleep(6)
        @@current_game.character.power += 5
        self.turkey_fight
    end

    #-------------------------------------------------------------------------------------------------------------------

    def self.duck_attack_sequence
        system('clear')
        self.duck_ascii
        # self.render_duck_ascii
        puts "You have #{@@current_game.character.hp} HP and #{@@current_game.character.power} Strength."
        choice = @@prompt.select("") do |p|
            p.choice "Attack"
        end
        case choice 
        when "Attack"
            player_roll = rand((@@current_game.character.power)..40)
            duck_roll = rand(1..40)
            puts "You rolled a #{player_roll}."
            puts "The duck rolled a #{duck_roll}."
            if player_roll > duck_roll
                @@current_game.character.power += 2
                puts "Well done, you defeated a duck. You ought to be proud of yourself!"
                puts "You gain 2 Strength."
                sleep(5)
                self.only_proceed_option
            else
                @@current_game.character.hp -= 2 
                if @@current_game.character.hp < 1
                    self.game_lose
                else
                    puts "You were defeated by a duck..."
                    puts "You lose 2 HP and 2 Strength"
                    puts "You decide to leave the duck alone as you are too ashamed of the events that have transpired."
                    sleep(5)
                    self.only_proceed_option
                end
            end
        end    
    end

    def self.duck_fight
        system('clear')
        self.duck_ascii
        # self.render_duck_ascii
        puts "You see a duck - it doesn't seem to be aggresive..."
        puts "You have #{@@current_game.character.hp} HP and #{@@current_game.character.power} Stregnth."
        choice = @@prompt.select("What would you like to do next?") do |p|
            p.choice "Proceed"
            p.choice "Attack"
            p.choice "Exit to Main Menu (Warning - You will lose all progress)"
        end
        case choice
        when "Proceed"
            if @@current_game.move_count == 1
                self.level_second_choice
            elsif @@current_game.move_count == 2
                self.level_third_choice
            elsif @@current_game.move_count == 3
                self.level_fourth_choice
            elsif @@current_game.move_count == 4
                self.second_level_second_choice
            elsif @@current_game.move_count == 5
                self.second_level_third_choice
            elsif @@current_game.move_count == 6
                self.second_level_third_choice
            elsif @@current_game.move_count == 7
                self.second_level_fourth_choice
            end
        when "Attack"
            puts "You decide to show the duck who's boss."
            sleep(2)
            self.duck_attack_sequence
        when "Exit to Main Menu (Warning - You will lose all progress)"
            system('clear')
            self.logo
            puts "You wimped out, your family will not survive the winter."
            sleep(3)
            self.main_menu
        end
    end

    def self.boar_fight
        system('clear')
        self.boar_ascii
        puts "You see a boar - it seems to be charging at you!"
        puts "Fleeing is not an option!"
        puts "You have #{@@current_game.character.power} Strength and #{@@current_game.character.hp} HP. "
        choice = @@prompt.select("") do |p|
            p.choice "Attack"
        end
        case choice 
        when "Attack"
            player_roll = rand((@@current_game.character.power)..40)
            boar_roll = rand(10..40)
            puts "You rolled a #{player_roll}."
            puts "The boar a #{boar_roll}."
            if player_roll > boar_roll
                @@current_game.character.power += 4
                puts "The mighty boar succumbs to your brute strength!"
                puts "You gain 4 Strength."
                puts "You rummage through the forest and manage to escape."
                puts "Your journey is near its end as you can hear the screech of the Turkey coming from the Marshlands."
                puts "Nowhere to go now but forward..."
                @@current_game.move_count = 4
                self.only_proceed_option
            else
                @@current_game.character.hp -= 3
                puts "The boar's tusks tore right through you!"
                puts "You lose 3 HP"
                sleep(5)
                if @@current_game.character.hp < 1
                    self.game_lose
                else
                    puts "You are heavily wounded but still mangage to elude the boar."
                    puts "Your journey is near its end as you can hear the screech of the Turkey from the Marshlands."
                    puts "Nowhere to go now but forward..."
                    @@current_game.move_count = 4
                    self.only_proceed_option
                end
            end
        end   
    end

    def self.turkey_fight
        system('clear')
        self.turkey_ascii
        # self.turkey_ascii
        puts "A beast emerges from the dense fog... a... turkey? A wretched beast of a turkey!!!"
        puts "Fleeing is not an option, take heed and smite the beast from whence it came!!!"
        puts "You have #{@@current_game.character.power} Strength and #{@@current_game.character.hp} HP. "
        choice = @@prompt.select("") do |p|
            p.choice "Attack"
        end
        case choice 
        when "Attack"
            player_roll = rand((@@current_game.character.power)..40)
            turkey_roll = rand(15..50)
            puts "You rolled a #{player_roll}."
            puts "The Turkey rolled a #{turkey_roll}."
            if player_roll > turkey_roll
                puts "Your musket merely stunned the massive beast!"
                puts "Wield your axe and strike again!"
                sleep(3)
                self.tf_stage_two
            else
                @@current_game.character.hp -= 5
                puts "The Turkey's tusks tore right through you!"
                puts "You lose 3 HP."
                sleep(3)
                if @@current_game.character.hp < 1
                    self.game_lose
                else
                    self.tf_stage_two
                end
            end
        end   
    end
    
    def self.tf_stage_two
        puts "The screetch of the massive foul mutes your hearing, you're wounded... do not give in!"
        @@current_game.character.power -= 5
        puts "You have #{@@current_game.character.power} Strength and #{@@current_game.character.hp} HP. "
        choice = @@prompt.select("") do |p|
            p.choice "Attack"
        end
        case choice 
        when "Attack"
            player_roll = rand((@@current_game.character.power)..40)
            turkey_roll = rand(10..40)
            puts "You rolled a #{player_roll}."
            puts "The Turkey rolled a #{turkey_roll}."
            if player_roll > turkey_roll
                sleep(3)
                self.game_win
            else
                @@current_game.character.hp -= 4
                puts "The boar's tusks tore right through you!"
                puts "You lose 3 HP"
                puts "You now have #{@@current_game.character.hp} HP."
                sleep(3)
                if @@current_game.character.hp < 1
                    self.game_lose
                else
                    self.tf_stage_two
                end
            end
        end 
    end
    
    def last_stand
        system('clear')
        puts "Your wounds are deep and the Turkey still stands... make it tonight's dinner feast!"
        choice = @@prompt.select("") do |p|
            p.choice "Attack"
        end
        case choice 
        when "Attack"
            player_roll = rand((@@current_game.character.power)..40)
            turkey_roll = rand(10..40)
            puts "You rolled a #{player_roll}."
            puts "The Turkey rolled a #{turkey_roll}."
            if player_roll > turkey_roll
                sleep(3)
                self.game_win
            else
                self.game_lose
            end
        end
    end

    def self.game_lose
        system('clear')
        self.game_lose_ascii
        puts "All hope is lost! There's no surviving the long, cold winter that lies ahead!"
        sleep(6)
        self.main_menu
    end

    def self.game_win
        system ('clear')
        self.win_game_ascii
        puts "Rejoice! The mutant turkey sheds no more Pilgrim blood! Let us 'give thanks' for this bountiful meal!"
        sleep(7)
        self.main_menu
    end

    #Level One Choices -----------------------------------------------------

    def self.level_first_choice
        self.game_map_first_level
        choice = @@prompt.select("Select for 1st Path") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" 
            @@current_game.move_count = 1
            self.duck_fight 
        when "Left Path"
            @@current_game.move_count = 1
            self.mushroom
        end
    end

    def self.level_second_choice
        self.game_map_first_level
        choice = @@prompt.select("Select for 2nd Path") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" 
            @@current_game.move_count = 2
            self.power_up_path
        when "Left Path" 
            @@current_game.move_count = 2
            self.rabbit
        end
    end

    def self.level_third_choice
        self.game_map_first_level
        choice = @@prompt.select("Select for 3rd Path") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" 
            @@current_game.move_count = 3
            self.power_up_path
        when "Left Path" 
            @@current_game.move_count = 3
            self.duck_fight
        end
    end
    
    def self.level_fourth_choice
        self.game_map_first_level
        choice = @@prompt.select("Select for 4th Path") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" 
            self.potato_path
        when "Left Path" 
            self.bionic_leg
        end
    end

    #LEVEL TWO CHOICES------------------------------------------------------

    def self.second_level_first_choice
        self.game_map_second_level
        choice = @@prompt.select("Select for 1st Path") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" 
            @@current_game.move_count = 5
            self.power_up_path
        when "Left Path" 
            @@current_game.move_count = 5
            self.rabbit
        end
    end

    def self.second_level_second_choice
        self.game_map_second_level
        choice = @@prompt.select("Select for 2nd Path") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" 
            @@current_game.move_count = 6
            self.duck_fight
        when "Left Path" 
            @@current_game.move_count = 6
            self.power_up_path
        end
    end

    def self.second_level_third_choice
        self.game_map_second_level
        choice = @@prompt.select("Select for 3rd Path") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" 
            @@current_game.move_count = 7
            self.mushroom
        when "Left Path" 
            @@current_game.move_count = 7
            self.duck_fight
        end
    end
    
    def self.second_level_fourth_choice
        self.game_map_second_level
        choice = @@prompt.select("Select for 4th Path") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" 
            self.bionic_arm
        when "Left Path" 
            self.strange_plant
        end
    end

end #.class CLI