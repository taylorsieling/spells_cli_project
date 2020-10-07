# initialize method
# instantiate new objects
# keep track of spells
# turn responses into objects
# save all spells created

class Spell 

    attr_accessor :name, :index_name, :class_name, :level, :casting_time, :range, :duration, :school, :desc, :components
    @@all = []

    def initialize(name:, index_name:, class_name:)
        @name = name
        @index_name = index_name
        @class_name = class_name
        @level = level
        @school = school
        @range = range
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.find(spell)
        @@all.select { |sp| sp == spell }
    end


    #search spells by school
    #search spells by level
    #search spells by dc/damage type

end