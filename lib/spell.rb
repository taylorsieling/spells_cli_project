# initialize method
# instantiate new objects
# keep track of spells
# turn responses into objects
# save all spells created

class Spell 

    attr_accessor :name, :index_name, :class_name
    @@all = []

    def initialize(name:, index_name:, class_name:)
        @name = name
        @index_name = index_name
        @class_name = class_name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.find_by_class_name(class_name)
        @@all.select {|spell| spell.class_name == class_name}
    end

    #search spells by school
    #search spells by level
    #search spells by dc/damage type

end