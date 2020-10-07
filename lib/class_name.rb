require 'pry'

class ClassName

    attr_accessor :name, :spells
    @@all = []

    def initialize(name)
        @name = name
        @spells = []
        @@all << self
    end 

    def self.all
        @@all
    end

    def self.find_by_class_name(class_name)
        @@all.find {|cn| cn.name == class_name}
    end

end
