class Clock
    attr_reader :minutes

    def initialize(hour:0,minute:0)
        @minutes = (hour * 60 + minute) % (60 * 24)
    end

    def hour
        @minutes / 60 % 24
    end

    def minute
        @minutes % 60
    end

    def to_s
        "%02d:%02d" % [hour, minute]
    end

    def +(other_clock)
        @minutes += other_clock.minutes
        self
    end

    def -(other_clock)
        @minutes -= other_clock.minutes
        self
    end

    def ==(other_clock)
        minutes == other_clock.minutes
    end
end
