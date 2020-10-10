# handle all of our API requests

require 'pry'

class API

    def self.fetch_spells(class_object)
        url = "https://www.dnd5eapi.co/api/classes/#{class_object}/spells"
        uri = URI(url)
        response = Net::HTTP.get(uri)

        spell_list = JSON.parse(response)["results"]
        new_class = CharacterClass.new(class_object)
        spell_list.each do |spell|
            new_spell = Spell.new(name: spell["name"], index_name: spell["index"], class_name: class_object)
            new_class.spells << new_spell
        end
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
        spell.character_classes = data["classes"]
        spell.ritual = data["ritual"]
        spell.concentration = data["concentration"]
    end

    # got rid of character_class_list
    # created class objects
end