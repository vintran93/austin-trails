class AustinTrails::Detail

    attr_accessor :name, :hike #:description

    @@all = []

    def initialize(name, hike)
        @name = name
        @hike = hike
        add_to_hike
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_to_hike
        @hike.details << self unless @hike.details.include?(self)
    end
end