require_relative "./austin_trails/version.rb"
require_relative "./austin_trails/cli.rb"
require_relative "./austin_trails/detail.rb"
require_relative "./austin_trails/scraper.rb"
require_relative "./austin_trails/hike.rb"

require 'colorize'
require "nokogiri"
require "pry"
require "open-uri"

module AustinTrails
  class Error < StandardError; end
  # Your code goes here...
end
