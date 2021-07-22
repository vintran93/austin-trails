class AustinTrails::CLI # name spacing
    def start
        welcome_user
        list_hikes
        menu
        see_you_later
    end 

    def welcome_user
        puts "Welcome to the city of Austin! Here are the top 10 hiking trails to explore in this beautiful city.".colorize(:green)
        #@trails = [1,2,3,4,5,6,7,8,9,10]
        #AustinTrails::Scraper.scrape_trails
        #AustinTrails::Trail.new("Twin Falls")
        #AustinTrails::Trail.new("Barton Creek Greenbelt")
        @hikes = AustinTrails::Hike.all
    end

    def list_hikes
        @hikes.each.with_index(1) do |hike, index|
            puts "#{" "} #{hike.name}"
        end
    end 
        
    def menu
        input = nil
        while input != "close"
            puts "Please choose the hike you would like to explore or type close. Type list to refresh the page.".colorize(:green)
            input = gets.strip
            case input
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
                puts "That is an invalid input, type list or close." unless "close"
            end
        end
    end

    #def get_user_hike
    #    selected_hike = gets.strip.to_i
    #    display_details(selected_hike) if valid_input(selected_hike, @hikes)
    #end

    #def valid_input(input, data)
    #    input.to_i <= data.length && input.to_i > 0
    #end

    #def display_details(selected_hike)
     #   hike = @hikes[selected_hike - 1]
     #   hike.get_details
      #  puts "Here are the details for #{hike.name}.".colorize(:green)
      #  hike.details.each.with_index(1) do |detail|
     #       puts detail.name
        #binding.pry
      #  end 
    #end

    def see_you_later
        puts "See you later!"
    end

end

