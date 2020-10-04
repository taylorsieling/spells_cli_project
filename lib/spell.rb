# initialize method
# instantiate new objects
# keep track of spells
# turn responses into objects
# save all spells created

class Spell 

    attr_accessor :name, :index
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

end