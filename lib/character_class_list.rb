require 'pry'

class CharacterClassList

    attr_accessor :list
    @@all = []

    def initialize
        @list = list
        @@all << self
    end

    def self.all
        @@all
    end

end