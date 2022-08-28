class AustinTrails::Hike

    attr_accessor :name, :description, :intro, :heading 

    def self.trail
        self.scrape_details
    end

    def self.scrape_details
        details = []
        details << self.scrape_intro
        slugs = [
            "mayfield-nature-preserve", "river-place-nature-trail",
            "wild-basin-wilderness-preserve", "mount-bonnell",
            "blunn-creek-preserve", "turkey-creek-trail", 
            "mckinney-falls-state-park","mary-moore-searight-park",
            "ann-and-roy-butler-hike-and-bike-trail","barton-creek-greenbelt"
        ]

        slugs.each do |slug|
            details << self.scrape_hike_site(slug)
        end

        return details
    end

    def self.scrape_hike_site(slug)
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/#{slug}"))
        hike = self.new 
        hike.name = doc.search("div h1").text.strip
        hike.description = doc.search("div#content").children.text.strip
        hike 
    end

    def self.scrape_intro
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/best-hikes-in-austin"))
        hike = self.new
        hike.intro = doc.search("div#content p").text 
        hike.heading = doc.search("div._container_14kkg_1 p").text
        hike 
    end

    
end