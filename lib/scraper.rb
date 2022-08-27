class AustinTrails::Scraper

    def self.scrape_hikes
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/best-hikes-in-austin"))
        hikes = doc.search("h3.card-title a")

        hikes.each do |h|
            name = h.text.strip.colorize(:green)
            AustinTrails::Hike.new(name)
        end
    end

    def self.scrape_details(hike)
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/mayfield-nature-preserve"))
        #description = self.new
        
        #description = doc.search("p span")
        #address = doc.search("td").text
        #details = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip

        #details.each do |d|
            #name = d.text.strip.colorize(:green)
        AustinTrails::Detail.new("address", hike)
        AustinTrails::Detail.new("description", hike)
        AustinTrails::Detail.new("length", hike)
        binding.pry
        #end
        #details
    end
end

#https://www.timeout.com/austin/things-to-do/river-place-nature-trail
#https://www.timeout.com/austin/things-to-do/wild-basin-wilderness-preserve
#https://www.timeout.com/austin/things-to-do/mount-bonnell
#https://www.timeout.com/austin/things-to-do/blunn-creek-preserve
#https://www.timeout.com/austin/things-to-do/barton-creek-greenbelt
#https://www.timeout.com/austin/things-to-do/turkey-creek-trail
#https://www.timeout.com/austin/things-to-do/mckinney-falls-state-park
#https://www.timeout.com/austin/things-to-do/mary-moore-searight-park
#https://www.timeout.com/austin/things-to-do/ann-and-roy-butler-hike-and-bike-trail