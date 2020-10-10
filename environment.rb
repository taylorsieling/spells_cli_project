# connect whole program so files can talk
# require all gems and files

require 'pry'
require 'net/http'
require 'json'

require_relative './lib/api'
require_relative './lib/cli'
require_relative './lib/spell'
require_relative './lib/character_class'