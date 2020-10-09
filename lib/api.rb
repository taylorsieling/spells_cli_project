# handle all of our API requests

class API

    attr_accessor :class_list

    def self.fetch_spells(class_name)
        url = "https://www.dnd5eapi.co/api/classes/#{class_name}/spells"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        spells = JSON.parse(response)["results"]
        new_class = CharacterClass.new(class_name)
        spells.each do |spell|
            new_spell = Spell.new(name: spell["name"], index_name: spell["index"], class_name: class_name)
            new_class.spells << new_spell
        end
        # binding.pry
    end


    def self.get_spell_details(spell)
        url = "https://www.dnd5eapi.co/api/spells/#{spell.index_name}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        spell.level = data["level"]
        spell.school = data["school"]
        spell.casting_time = data["casting_time"]
        spell.range = data["range"]
        spell.duration = data["duration"]
        spell.components = data["components"]
        spell.desc = data["desc"]
        spell.player_classes = data["classes"]
        spell.ritual = data["ritual"]
        spell.concentration = data["concentration"]
        # binding.pry
    end

    def self.get_character_class_list
        url = "https://www.dnd5eapi.co/api/classes"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        class_list = JSON.parse(response)["results"]
    end

end
