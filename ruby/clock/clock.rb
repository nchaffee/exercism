class Clock
    attr_reader :hour, :minute

    def initialize(hour:0,minute:0)
        total_mins = hour * 60 + minute;
        @hour = total_mins / 60 % 24;
        @minute = total_mins % 60;
    end

    def +(clock)
        Clock.new(hour: @hour + clock.hour, minute: @minute + clock.minute)
    end

    def -(clock)
        self.+ Clock.new(hour: clock.hour * -1, minute: clock.minute * -1)
    end

    def ==(clock)
        self.hour == clock.hour && self.minute == clock.minute
    end

    def to_s
        "#{pad(@hour)}:#{pad(@minute)}"
    end

    private

    def pad(num)
        num.to_s.rjust(2, "0")
    end
end
