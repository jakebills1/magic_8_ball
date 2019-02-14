require "pry"

class EightBall
    def initialize(answers)
        @answers = answers
        question
    end
    def question
        puts "Welcome to the Ruby magic eight ball"
        puts "Type a question, or type quit to exit"
        input = gets.strip
        if input != "quit"
            puts @answers.sample
            question
        else
            exit
        end
    end
end

answers = ["yes", "no", "maybe", "Not likely", "All signs point to no"]

app = EightBall.new(answers)