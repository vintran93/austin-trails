class AustinTrails::CLI # name spacing
    def start 
        puts "Welcome to the city of Austin! Austin is known for its beautiful hiking trails throughout the city. There are 126 trails to choose from!"
        get_all_trails
        list_trails
        #get_user_trail
        #binding.pry
    end 

    def get_all_trails
        #to be scraped
        @trails = [1,2,3,4,5,6,7,8,9,10]
    end

    def list_trails
        puts "Please choose the trail number you would like to explore"
        @trails.each.with_index(1) do |trail, index|
            puts "#{index}. #{trail}"
        end
    end

    def get_user_trail
        selected_trail = gets.strip
        binding.pry
        #if valid_input(selected_trail.to_i, @trails)
        #end 
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0 
        
    end
end

