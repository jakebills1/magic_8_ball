require "pry"
require "colorize"

class EightBall
    def initialize(answers, options)
        @answers, @options = answers, options
        question
    end
    def question
        puts "Welcome to the Ruby magic eight ball"
        puts "What would you like to do?"
        
        @options.each_with_index do |option, index|
            puts "#{index + 1}) #{option}"
        end
        
        input = gets.to_i
        
        case input
        when 1
            puts "Type your question now: "
            q = gets
            puts @answers.sample.colorize(:red)
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
end

answers = ["yes", "no", "maybe", "Not likely", "All signs point to no"]

menu_options = ["Ask a question", "Add an answer", "Reset to default answers", "quit"]

app = EightBall.new(answers, menu_options)