# initialize method
# instantiate new objects
# keep track of spells
# turn responses into objects
# save all spells created

class Spell 

    attr_accessor :name, :index_name, :class_name, :level, :casting_time, :range, :duration, :school, :desc, :components, :player_classes
    @@all = []

    def initialize(name:, index_name:, class_name:)
        @name = name
        @index_name = index_name
        @class_name = class_name
        @level = level
        @school = school
        @range = range
        @player_classes = []
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.find(spell)
        @@all.select { |sp| sp == spell }
    end

end