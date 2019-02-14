require "pry"
require "colorize"

class EightBall

    def initialize(answers, options, colors)
        @answers, @options, @colors = answers, options, colors
        @backup_answers = @answers.clone
        question
    end

    def question
        puts "Welcome to the Ruby magic eight ball"
        puts "What would you like to do?"
        
        @options.each_with_index do |option, index|
            puts "#{index + 1}) #{option}"
        end
        # binding.pry
        input = gets.to_i
        
        case input
        when 1
            puts "Type your question now: "
            q = gets
            puts @answers.sample.colorize(@colors.sample).blink
            puts 
            question
        when 2
            add_answer
        when 3
            reset
        when 4
            puts "Goodbye"
            sleep(3)
            puts `clear`
            exit
        else
            puts "invalid entry"
            question
        end
    end
    
    def add_answer
        puts "What answer would you like to add?"
        q = gets.strip
        if !@answers.include? q
            @answers << q
            question
        else
            puts "That answer is already present"
            question
        end
    end
    
    def reset
        @answers = @backup_answers.clone
        question
    end
end

colors = [:red, :green, :yellow, :blue, :magenta, :cyan, :white]

answers = ["yes", "no", "maybe", "Not likely", "All signs point to no"]

menu_options = ["Ask a question", "Add an answer", "Reset to default answers", "quit"]

app = EightBall.new(answers, menu_options, colors)