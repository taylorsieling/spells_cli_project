# interactions with the user
# contain all gets and puts
# control the flow of our program

class CLI

    def start
        puts ""
        puts "Welcome to D&D 5E Spell Finder!"
        puts ""
        puts "Search for a spell by entering a Player Class!"
        puts ""
        @class_name = gets.strip.downcase
        puts ""
        API.fetch_spells(@class_name)
        class_spells = Spell.all
        print_spells(class_spells)
        puts ""
        puts "Enter a number for the full spell details or enter 'exit' to exit."
        puts ""
        input = gets.strip.downcase
        while input != "exit" do 
            s = Spell.find_by_class_name(@class_name)[input.to_i - 1]
            API.get_spell_details(s)
        end
    end

    def print_spells(spells)
        puts ""
        puts "Here are the #{@class_name} spells:"
        puts ""
        spells.each_with_index do |spell, i|
            puts "#{i+1}. #{spell.name}"
        end
    end


end