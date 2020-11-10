require "tty-prompt"
require "tty-font"
require "pry"


class CLI
    
    @@prompt = TTY::Prompt.new
    @@user = nil
    @@font = TTY::Font.new(:doom)
    # @@table = TTY::Table.new do |t|
    #     t << ["a1", "a2"]
    #     t << ["b1", "b2"]
    #   end
    #add picture of pilgrim hat/turkey
    #add animated arrows

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
        # puts @@table.render(:ascii)
        choice = @@prompt.select("Choose an Option") do |prompt|
            prompt.choice "Log In"
            prompt.choice "Create User"
            prompt.choice "Delete User"
            prompt.choice "Manual"
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
        choice = @@prompt.select("Choose an Option") do |prompt|
            prompt.choice "Login"
            prompt.choice "Main Menu"
        end 
        case choice
        when "Login"
            username = @@prompt.ask("Username:")
            password = @@prompt.mask("Password:")
            @user = User.find_by(username: username, password: password)
            if @user 
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
        choice = @@prompt.select("Choose an Option") do |prompt|
            prompt.choice "Create User"
            prompt.choice "Main Menu"
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
        choice = @@prompt.select("Choose an Option") do |prompt|
            prompt.choice "Delete User"
            prompt.choice "Main Menu"
        end 
        case choice
        when "Delete User"
            system('clear')
            self.logo
            username = @@prompt.ask("Username:")
            password = @@prompt.mask("Password:")
            User.all.select do |user| 
                if user.username == username && user.password == password 
                    user.destroy
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
            p.choice "Thomas Smith - Strong! Lacking in funds."
            p.choice "Elizabeth Holmsworth - "
        end
        case choice
        when "Thomas Smith"
            
        end
    end


end #.class CLI