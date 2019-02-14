# require "pry"
require "colorize"

class EightBall

    def initialize(answers, options, admin_options, colors)
        @answers, @options, @admin_options, @colors = answers, options, admin_options, colors
        @backup_answers = @answers.clone
        eight_ball_art
    end

    def eight_ball_art
        lines = ["        ____", "    ,dP9CGG88@b,", "  ,IP  _   Y888@@b,", " dIi  (_)   G8888@b", "dCII  (_)   G8888@@b", 
        "GCCIi     ,GG8888@@@", "GGCCCCCCCGGG88888@@@", "GGGGCCCGGGG88888@@@@...", "Y8GGGGGG8888888@@@@P.....", " Y88888888888@@@@@P......", 
        " `Y8888888@@@@@@@P'......", "    `@@@@@@@@@P'.......", "        """"........" ]

        lines.each do |line|
            puts line.colorize(@colors.sample)
        end
        question
    end

    def question
        puts "Welcome to the Ruby magic eight ball"
        puts "What would you like to do?"
        
        @options.each_with_index do |option, index|
            puts "#{index + 1}) #{option}"
        end
        # binding.pry
        print "> "
        input = gets.strip
        
        case input
        when "1"
            puts "Type your question now: "
            print "> "
            q = gets
            puts @answers.sample.colorize(@colors.sample)
            puts 
            question
        when "2"
            puts "Goodbye"
            sleep(1.5)
            puts `clear`
            exit
        when "admin"
            admin_menu
        else
            puts "invalid entry"
            question
        end
    end
    
    def admin_menu
        puts "Pick an admin option: "
        @admin_options.each_with_index do |option, index|
            puts "#{index + 1}) #{option}"
        end
        print "> "
        choice = gets.strip
        case choice
        when "1"
            add_answer
        when "2"
            reset
        when "3"
            print_answers
        when "4"
            question
        else
            puts "invalid entry"
            admin_menu
        end

    end
    
    def add_answer
        puts "What answer would you like to add?"
        print "> "
        q = gets.strip
        if !@answers.include? q
            @answers << q
            admin_menu
        else
            puts "That answer is already present"
            admin_menu
        end
    end
    
    def reset
        @answers = @backup_answers.clone
        admin_menu
    end

    def print_answers
        @answers.each do |answer|
            puts answer
        end
        admin_menu
    end
end

colors = [:red, :green, :yellow, :blue, :magenta, :cyan]

answers = ["yes", "no", "maybe", "Not likely", "All signs point to no"]

menu_options = ["Ask a question", "quit"]

admin_options = ["Add an answer", "Reset to default answers", "Print all answers", "Return to user menu"]

app = EightBall.new(answers, menu_options, admin_options, colors)