Flow

Classes a. class relationships

User starts app
user sees a list of trails
user selects a trail
provides details on the trail such as distance, description, key info, etc.
Classes:

1) Trail (stores trails)
2) CLI 
3) Scraper
Scraping from the website https://www.timeout.com/austin/things-to-do/best-hikes-in-austin

Get real trails (names, directions) Get directions, key info

        when "1"
            puts "Here are details for hike number 1..."
        when "2"
            puts "Here are details for hike number 2..."
        when "3"
            puts "Here are details for hike number 3..."
        when "4"
            puts "Here are details for hike number 4..."
        when "5"
            puts "Here are details for hike number 5..."
        when "6"
            puts "Here are details for hike number 6..."
        when "7"
            puts "Here are details for hike number 7..."
        when "8"
            puts "Here are details for hike number 8..."
        when "9"
            puts "Here are details for hike number 9..."
        when "10"
            puts "Here are details for hike number 10..."
        when "list"
            list_hikes
        else
            puts "That is an invalid input, type list or close."
        end