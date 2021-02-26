class Clock
    attr_reader :hour, :minute

    def initialize(hour:0,minute:0)
        minute_to_hours, @minute = minute.divmod(60);
        @hour = (hour + minute_to_hours) % 24;
    end

    def +(clock)
        Clock.new(
            hour: @hour + clock.hour,
            minute: @minute + clock.minute
        )
    end

    def -(clock)
        Clock.new(
            hour: @hour - clock.hour,
            minute: @minute - clock.minute
        )        
    end

    def ==(clock)
        @hour == clock.hour && @minute == clock.minute
    end

    def to_s
        "%02d:%02d" % [@hour, @minute]
    end
end
