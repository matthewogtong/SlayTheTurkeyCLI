require "tty-prompt"
require "tty-table"
require "tty-font"
require "pry"


class CLI
    
    @@prompt = TTY::Prompt.new
    # @@user = nil
    @@font = TTY::Font.new(:doom)
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
            prompt.choice "Enter Username"
            #password method
            prompt.choice "Main Menu"
        end 
        case choice
        when "Enter Username"
            username = @@prompt.ask("Username:")
            password = @@prompt.mask("Password:")
            # User.find_by
            # self.login_main_menu
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
            @user = User.create(username: username, password: password)
            system('clear')
            CLI.main_menu
        when "Main Menu"
            CLI.main_menu
        end 
    end #create_user

    def login_main_menu
        
    end
    # def self.delete_user
    #     choice = @@prompt.select("Choose an Option") do |prompt|
    #         prompt.choice "Go back to title screen"
    #     end
    #     @@prompt.ask("Please type in the user you want to delete:") #do |q|
    #     # q.validate { |input| input =~ /^[^\.]+\.[^\.]+/ }
    #     @@prompt.ask("Please type in your password:") 
    #     @@prompt.ask("Are you sure?")
    # end #delete_user

    # def self.manual
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

end #.class CLI