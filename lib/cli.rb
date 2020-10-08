# interactions with the user
# contain all gets and puts
# control the flow of our program

class CLI

    def start
        puts ""
        puts "Welcome to D&D 5E Spell Finder!"
        prompt_player_class
        prompt
        input = gets.strip.downcase
        while input != 'exit' do
            if input == 'list' 
                print_spell_list(ClassName.find_by_class_name(@class_name).spells)
            elsif input.to_i > 0 && input.to_i <= ClassName.find_by_class_name(@class_name).spells.length
                spell = ClassName.find_by_class_name(@class_name).spells[input.to_i - 1]
                if !spell.level
                    API.get_spell_details(spell)
                    print_spell(spell)
                else
                    print_spell(Spell.find(spell)[0])
                end
            elsif input == 'class'
                prompt_player_class
            else
                puts "Uh oh, I'm not proficient in that language! Please try again."
            end
            prompt
            input = gets.strip.downcase
        end
        puts ""
        puts "May the roll be ever in your favor!"
        puts ""
    end

    def print_spell_list(spells)
        puts ""
        puts "Here are the #{@class_name} spells:"
        puts ""
        spells.each_with_index do | spell, i |
            puts "#{i+1}. #{spell.name}" 
        end
        # binding.pry
    end

    def print_spell(spell)
        puts ""  
        puts "----------------"
        puts ""  
        puts "Spell: #{spell.name}"
        puts ""
        puts "----------------"
        puts ""

        if spell.level == 0
            puts "Level: Cantrip"
        else
            puts "Level: #{spell.level}"
        end

        cl = spell.player_classes.each_with_object([]) { |h,a| a << h["name"] }
        puts "Classes: #{cl.join(", ")}" 

        puts "School: #{spell.school.values[1]}"
        puts "Casting Time: #{spell.casting_time}"
        puts "Range: #{spell.range}"
        puts "Duration: #{spell.duration}"
        puts "Components: #{spell.components.join(", ")}"
        puts ""
        puts "Spell Description:"
        puts ""
        puts "#{spell.desc.join}"
        puts ""
        puts "----------------"
        puts ""
    end

    def prompt
        puts ""
        puts "Enter a number to see the spell details!"
        puts "To view another Player Class Spell List, enter 'class'."
        puts "To view the list again, enter 'list'."
        puts "Or, type 'exit' to exit the program." 
        puts ""
    end

    def prompt_player_class
        puts ""
        puts "Search for a spell by entering a Player Class!"
        puts ""
        @class_name = gets.strip.downcase
        puts ""
        API.fetch_spells(@class_name)
        puts ""
        print_spell_list(ClassName.find_by_class_name(@class_name).spells)
        
    end

end                                                                                            