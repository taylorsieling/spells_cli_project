# handle all of our API requests

class API

    def self.fetch_spells(class_name)
        url = "https://www.dnd5eapi.co/api/classes/#{class_name}/spells"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        spells = JSON.parse(response)["results"]
        spells.each do |spell|
            Spell.new (name = spell["name"])
        end
    end

end
