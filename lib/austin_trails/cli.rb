# class AustinTrails::CLI # name spacing
#     def start
#         welcome_user
#         list_hikes
#         menu
#         see_you_later
#     end 

#     def welcome_user
#         puts "Welcome to the city of Austin! Here are the top 10 hiking trails to explore in this beautiful city.".colorize(:green)
#         #@trails = [1,2,3,4,5,6,7,8,9,10]
#         #AustinTrails::Scraper.scrape_trails
#         #AustinTrails::Trail.new("Twin Falls")
#         #AustinTrails::Trail.new("Barton Creek Greenbelt")
#         @hikes = AustinTrails::Hike.all
#     end

#     def list_hikes
#         @hikes.each.with_index(1) do |hike, index|
#             puts "#{" "} #{hike.name}"
#         end
#     end 
        
#     def menu
#         input = nil
#         while input != "close"
#             puts "Please choose the hike you would like to explore or type close. Type list to refresh the page.".colorize(:green)
#             input = gets.strip
#             case input
#             when "1"
#                 puts "Here are details for hike number 1..."
#             when "2"
#                 puts "Here are details for hike number 2..."
#             when "3"
#                 puts "Here are details for hike number 3..."
#             when "4"
#                 puts "Here are details for hike number 4..."
#             when "5"
#                 puts "Here are details for hike number 5..."
#             when "6"
#                 puts "Here are details for hike number 6..."
#             when "7"
#                 puts "Here are details for hike number 7..."
#             when "8"
#                 puts "Here are details for hike number 8..."
#             when "9"
#                 puts "Here are details for hike number 9..."
#             when "10"
#                 puts "Here are details for hike number 10..."
#             when "list"
#                 list_hikes
#             else
#                 puts "That is an invalid input, type list or close." unless "close"
#             end
#         end
#     end

#     #def get_user_hike
#     #    selected_hike = gets.strip.to_i
#     #    display_details(selected_hike) if valid_input(selected_hike, @hikes)
#     #end

#     #def valid_input(input, data)
#     #    input.to_i <= data.length && input.to_i > 0
#     #end

#     #def display_details(selected_hike)
#      #   hike = @hikes[selected_hike - 1]
#      #   hike.get_details
#       #  puts "Here are the details for #{hike.name}.".colorize(:green)
#       #  hike.details.each.with_index(1) do |detail|
#      #       puts detail.name
#         #binding.pry
#       #  end 
#     #end

#     def see_you_later
#         puts "See you later!"
#     end

# end



class AustinTrails::CLI
    
    def start
        welcome_user
        type_enter
    end

    def welcome_user
        puts    " _______________________________________________________________________________________".colorize(:green)
        puts    "|                                                                                       |".colorize(:green)
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|     Welcome to Austin! This city is known for having many beautiful hiking trails.    |".colorize(:green)                      
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|                                                                                       |".colorize(:green)
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|            Looking for a new adventure in the hill country of Texas?                  |".colorize(:green)
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|                                                                                       |".colorize(:green)                               
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|                               Type enter to continue                                  |".colorize(:green)
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|_______________________________________________________________________________________|".colorize(:green)
    end

    def type_enter
        input = gets.strip
        if input == "enter"
            introduction
            list_trails
            menu
        elsif input == "exit"
            exit
        else 
            puts "That is an invalid answer, please type enter or exit".colorize(:yellow)
            type_enter
        end
    end  

    def introduction
        intro = AustinTrails::Hike.trail[0]
        puts "#{intro.heading}".strip.colorize(:green) + "\n" + "\n" + "#{intro.intro}".strip.colorize(:green)
    end

    def list_trails
        puts "Here are the top 10 hiking trails in Austin, Texas.".colorize(:green)
        @details = AustinTrails::Hike.trail[1..10] #class method called trail that returns all details for the names
        @details.each.with_index(1) do |hike, index|
            puts "#{index}. #{hike.name}".colorize(:yellow)
        end
        puts "Enter the number of the hike for more info or type exit:".colorize(:green)
    end

    def valid_input?(input, data)
        input <= data.length && input > 0
    end

    def menu
        input = nil
        until input == "exit"
            input = gets.strip.downcase
            selected_hike = input.to_i
            if valid_input?(selected_hike, @details)
                selected_hike = @details[input.to_i-1] # we want the array index of the details
                puts "Here are the details for - #{selected_hike.name}".colorize(:yellow) + "\n" + "\n" + 
                "#{selected_hike.description}".colorize(:green)
                puts "Enter another hike number for more info or type list or exit.".colorize(:yellow)
            elsif input == "list"
                list_trails
            elsif input == "exit"
                continue?
            else
                puts "That was an invalid answer, please type the trail number, list or exit.".colorize(:yellow)
            end
        end
    end

    def continue?
        puts "Do you want to keep searching? Enter yes or no.".colorize(:yellow)
        input = gets.strip
        if input == "yes"
            puts "Which trail would you like to search?".colorize(:yellow)
            list_trails
            menu
        elsif input == "no"
            exit
        else 
            puts "That was an invalid answer.".colorize(:yellow)
            continue?
        end
    end

    def exit
        puts "Thank you for stopping by. See you next time!".colorize(:yellow)
    end
end