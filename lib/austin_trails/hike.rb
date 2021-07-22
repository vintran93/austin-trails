class AustinTrails::Hike

    attr_accessor :name, :details

    @@all = []

    def initialize(name)
        @name = name
        @details = []
        save
    end

    def self.all
        AustinTrails::Scraper.scrape_hikes if @@all.empty?
        @@all
    end

    def get_details
        AustinTrails::Scraper.scrape_details(self) if @details.empty?
    end

    def save
        @@all << self
    end
end