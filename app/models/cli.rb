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
    # table_emojis = ["💰", "💪", "🪓", "🦆", "👨‍🌾","🧝‍♀️", " 🥔"]
    @@table_boar = TTY::Table.new do |t|
        t << ["🐗", "🐗"]
        t << ["💪", " 🥔"]
        t << ["c1", "c2"]
        t << ["d1", "d2"]
        t << ["e1", "e2"]
        t << ["Start", "Start"]
    end
    @@table_turkey = TTY::Table.new do |t|
        t << ["🦃", "🦃"]
        t << ["b1", "b2"]
        t << ["c1", "c2"]
        t << ["d1", "d2"]
        t << ["e1", "e2"]
        t << ["Start", "Start"]
    end
    #-----------------------------------------------------------------
    def run
        system('clear')
        CLI.main_menu
    end

    def self.logo
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
            @@user = User.create(username: username, password: password)
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
                if user.username == username && user.password == password
                    User.destroy(user.id)
                    puts "User Deleted!"
                    sleep(3)
                    CLI.main_menu
                else
                    puts "Invalid Username or Password!"
                    sleep(3)
                    self.delete_user
                end
            end 
            sleep(3)
            system('clear')
            CLI.main_menu
        when "Main Menu"
            CLI.main_menu
        end 
    end #delete_user

    # def self.manual
        # system('clear')
        # self.logo
    #     choice = @@prompt.select("Choose an Option") do |prompt|
    #         prompt.choice "Read the instructions"
    #         prompt.choice "Go back to title screen"
    #         case choice
    #         when "Go back to title screen"
    #             CLI.run 
    #         when "Read the instructions"
    #             puts "These are the instructions to play the game"
    #         end
    #     end
    # end #manual
    

    def self.select_character
        system('clear')
        self.logo
        choice = @@prompt.select("Choose a Character") do |p|
            p.choice "👨‍🌾 Thomas Smith"
            p.choice "🧝‍♀️ Elizabeth Holmsworth"
        end
        case choice
        when "👨‍🌾 Thomas Smith"
            thomas = Character.create({name: 'Thomas Smith', power: 5, money: 2, hp: 1, is_alive: true})
            @@current_game = Game.create({level_count: 0, move_count: 0, game_won: false})
            @@current_game.character = thomas
            @@character = @@current_game.character.name
            @@current_game.user = @@user
            thomas.save
            @@current_game.save
            self.game_start
        when "🧝‍♀️ Elizabeth Holmsworth"
            liz = Character.create({name: 'Elizabeth Holmsworth', power: 3, money: 4, hp: 1, is_alive: true})
            @@current_game = Game.create({level_count: 0, move_count: 0, game_won: false})
            @@current_game.character = liz
            @@character = @@current_game.character
            @@current_game.user = @@user
            liz.save
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
        puts @@font.write("LEVEL ONE", letter_spacing: 2)
        puts @@table_boar.render(:ascii, padding: 2)
    end

    def self.game_map_second_level
        system('clear')
        puts @@font.write("LEVEL TWO", letter_spacing: 2)
        puts @@table_turkey.render(:ascii, padding: 2)
    end

    def self.game_start
        system('clear')
        puts "You are entering Level 1!"
        sleep(2)
        system('clear')
        self.level_first_choice
    end

    def self.proceed_option
        choice = @@prompt.select("What would you like to do next?") do |p|
            p.choice "Proceed"
            p.choice "Check stats"
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
            end
        when "Check stats"
            puts "Your character has #{@@current_game.character.money} money and #{@@current_game.character.power} power."
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
                end
            end
        when "Exit to Main Menu (Warning - You will lose all progress)"
            system('clear')
            self.logo
            puts "You wimped out, your family will not survive the winter."
            sleep(3)
            self.main_menu
        end
    end

    def self.only_proceed_option
        choice = @@prompt.select("What would you like to do next?") do |p|
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
            end
        end
    end

    def self.money_path
        puts "Along your way you happen to find some money on the ground."
        puts "Finders keepers, losers weepers."
        @@current_game.character.money += 4
        self.proceed_option
    end

    def self.power_up_path
        puts "You come across an axe lying on the ground."
        puts "You grab the axe cause why not. You feel your power grow..."
        @@current_game.character.power += 2
        self.proceed_option
    end

    def self.potato_path
        puts "Potato filler"
        puts "Blah blah"
        sleep(3)
        @@current_game.character.hp += 3
        self.boar_fight
    end
    
    def self.duck_attack_sequence
        system('clear')
        #insert art of duck
        puts "You have #{@@current_game.character.power} power and #{@@current_game.character.hp} hp. "
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
                puts "Nice, you beat a duck, good for you!"
                puts "You gained +2 to your power"
                self.only_proceed_option
            else
                @@current_game.character.hp -= 2
                puts "You lost to a duck..."
                puts "You lose 2 hp"
                sleep(3)
                self.only_proceed_option
            end
        end    
    end

    def self.duck_fight
        puts "You see a duck. It doesn't seem to be aggresive."
        choice = @@prompt.select("What would you like to do next?") do |p|
            p.choice "Proceed"
            p.choice "Check stats"
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
            end
        when "Check stats"
            puts "Your character has #{@@current_game.character.money} money and #{@@current_game.character.power} power."
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
                end
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
        #insert art of boar
        puts "You see a boar. It seems to be charging at you."
        puts "Fleeing is not an option."
        puts "You have #{@@current_game.character.power} power and #{@@current_game.character.hp} hp. "
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
                puts "Nice, you beat a boar, good for you!"
                puts "You gained +4 to your power"
                sleep(3)
                self.game_map_second_level
            else
                @@current_game.character.hp -= 3
                puts "The boar's tusks tore right through you!"
                puts "You lose 3 hp"
                sleep(3)
                if @@current_game.character.hp < 1
                    self.game_lose
                else
                    self.only_proceed_option
                end
            end
        end   
    end

    def self.tukery_fight
        puts "A beast emerges from the dense fog... a... turkey? A wretched beast of a turkey!!!"
        puts "Fleeing is not an option, take heed and smite the beast from whence it came!!!"
        puts "You have #{@@current_game.character.power} power and #{@@current_game.character.hp} hp. "
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
                @@current_game.character.hp -= 3
                puts "The Turkey's tusks tore right through you!"
                puts "You lose 3 hp."
                sleep(3)
                if @@current_game.character.hp < 1
                    self.game_lose
                else
                    self.only_proceed_option
                end
            end
        end   
    end
    
    def self.tf_stage_two
        puts "The screetch of the massive foul mutes your hearing, you're wounded... do not give in!"
        @@current_game.character.power -= 5
        puts "You have #{@@current_game.character.power} power and #{@@current_game.character.hp} hp. "
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
                @@current_game.character.hp -= 3
                puts "The boar's tusks tore right through you!"
                puts "You lose 3 hp"
                puts "You now have #{@@current_game.character.hp} hp."
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
        #put some art
        puts "All hope is lost! There's no surviving the long, cold winter that lies ahead!"
        sleep(3)
        self.main_menu
    end

    def self.game_win
        system ('clear')
        #put some art
        puts "Rejoice! The mutant turkey sheds no more Pilgrim blood! Let us 'give thanks' for this bountiful meal!"
        sleep(3)
        self.main_menu
    end
    #Level One Choices -----------------------------------------------------

    def self.level_first_choice
        #will need a character location corresponding to game map
        self.game_map_first_level
        choice = @@prompt.select("Select your first path wisely") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" #move character location to path on board
            @@current_game.move_count = 1
            self.duck_fight #this will be a random space
        when "Left Path" #move character location to path on board
            @@current_game.move_count = 1
            self.power_up_path
        end
    end

    def self.level_second_choice
        #will need a character location corresponding to game map
        self.game_map_first_level
        choice = @@prompt.select("Select your second path wisely") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" #move character location to path on board
            @@current_game.move_count = 2
            self.money_path
        when "Left Path" #move character location to path on board
            @@current_game.move_count = 2
            self.boar_fight
        end
    end

    def self.level_third_choice
        #will need a character location corresponding to game map
        self.game_map_first_level
        choice = @@prompt.select("Select your third path wisely") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" #move character location to path on board
            @@current_game.move_count = 3
            self.money_path
        when "Left Path" #move character location to path on board
            @@current_game.move_count = 3
            self.power_up_path
        end
    end
    
    def self.level_fourth_choice
        #will need a character location corresponding to game map
        self.game_map_first_level
        choice = @@prompt.select("Select your fourth path wisely") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" #move character location to path on board
            @@current_game.move_count = 4
            self.potato_path
        when "Left Path" #move character location to path on board
            @@current_game.move_count = 4
            self.power_up_path
        end
    end

    #LEVEL TWO CHOICES------------------------------------------------------
    def self.second_level_first_choice
        #will need a character location corresponding to game map
        self.game_map_second_level
        choice = @@prompt.select("Select your first path wisely") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" #move character location to path on board
            @@current_game.move_count = 1
            self.duck_fight #this will be a random space
        when "Left Path" #move character location to path on board
            @@current_game.move_count = 1
            self.power_up_path
        end
    end

    def self.second_level_second_choice
        #will need a character location corresponding to game map
        self.game_map_second_level
        choice = @@prompt.select("Select your second path wisely") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" #move character location to path on board
            @@current_game.move_count = 2
            self.money_path
        when "Left Path" #move character location to path on board
            @@current_game.move_count = 2
            self.boar_fight
        end
    end

    def self.second_level_third_choice
        #will need a character location corresponding to game map
        self.game_map_second_level
        choice = @@prompt.select("Select your third path wisely") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" #move character location to path on board
            @@current_game.move_count = 3
            self.money_path
        when "Left Path" #move character location to path on board
            @@current_game.move_count = 3
            self.power_up_path
        end
    end
    
    def self.second_level_fourth_choice
        #will need a character location corresponding to game map
        self.game_map_second_level
        choice = @@prompt.select("Select your fourth path wisely") do |p|
            p.choice "Right Path"
            p.choice "Left Path"
        end
        case choice
        when "Right Path" #move character location to path on board
            @@current_game.move_count = 4
            self.money_path
        when "Left Path" #move character location to path on board
            @@current_game.move_count = 4
            self.power_up_path
        end
    end

end #.class CLI