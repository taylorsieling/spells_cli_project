# handle all of our API requests

class API

    def self.fetch_spells(class_name)
        url = "https://www.dnd5eapi.co/api/classes/#{class_name}/spells"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        spells = JSON.parse(response)["results"]
        new_class = ClassName.new(class_name)
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
    end

end
