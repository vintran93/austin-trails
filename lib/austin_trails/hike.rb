require 'nokogiri'
require 'net/http'
require 'uri'

class AustinTrails::Hike

    attr_accessor :name, :description, :intro, :heading

    def self.trail
        self.scrape_details
    end

    def self.scrape_details
        details = []
        details << self.scrape_intro
        slugs = [
            "mayfield-nature-preserve", "shoal-creek-greenbelt",
            "wild-basin-wilderness-preserve", "mount-bonnell",
            "blunn-creek-preserve", "turkey-creek-trail",
            "mckinney-falls-state-park","mary-moore-searight-park",
            "ann-and-roy-butler-hike-and-bike-trail","barton-creek-greenbelt"
        ]

        slugs.each do |slug|
            if slug == "shoal-creek-greenbelt"
                hike = self.new
                hike.name = "Shoal Creek Greenbelt"
                hike.description = <<~DESCRIPTION.strip
                    While you can start your journey from several points around downtown, as this creek connects to Lady Bird Lake, the best spot to get moving is from Pease Park. To the north, the trail passes through a picturesque live oak meadow with Spanish moss daintily dripping from a few towering oaks towards the seemingly secret and sacred Seiders Springs.
                    While not the bathing kind you'd find at Barton, the rock wall comes complete with a small saintly statue to add a holy touch to the flowing water. Choose to head south, and the city suddenly springs forth as you wind around the skyscrapers before approaching the Central Library and Butterfly Bridge.
                DESCRIPTION
                details << hike
            else
                details << self.scrape_hike_site(slug)
            end
        end

        return details
    end

    def self.scrape_hike_site(slug)
        url = URI.parse("https://www.timeout.com/austin/things-to-do/#{slug}")
        response = Net::HTTP.get(url)
        doc = Nokogiri::HTML(response)
        hike = self.new
        hike.name = doc.search("div h1").text.strip
        hike.description = doc.search("div#content").children.text.strip
        hike
    end

    def self.scrape_intro
        url = URI.parse("https://www.timeout.com/austin/things-to-do/best-hikes-in-austin")
        response = Net::HTTP.get(url)
        doc = Nokogiri::HTML(response)
        hike = self.new
        hike.intro = doc.search("div#content p").text.strip
        hike.heading = doc.search("div._container_14kkg_1 p").text.strip
        hike
    end
end