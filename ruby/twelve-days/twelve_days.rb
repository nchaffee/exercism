class TwelveDays
    DAYS = [
        "first",
        "second",
        "third",
        "fourth",
        "fifth",
        "sixth",
        "seventh",
        "eighth",
        "ninth",
        "tenth",
        "eleventh",
        "twelfth",
    ]

    GIFTS = [
        "twelve Drummers Drumming, ",
        "eleven Pipers Piping, ",
        "ten Lords-a-Leaping, ",
        "nine Ladies Dancing, ",
        "eight Maids-a-Milking, ",
        "seven Swans-a-Swimming, ",
        "six Geese-a-Laying, ",
        "five Gold Rings, ",
        "four Calling Birds, ",
        "three French Hens, ",
        "two Turtle Doves, and ",
        "a Partridge in a Pear Tree"
    ]

    def self.song
        DAYS.each_with_index.inject("") do |output, (day, idx)|
            pad, gifts = idx == 0 ?
                ["", GIFTS[-1]]
                :
                ["\n", GIFTS[(GIFTS.length - idx - 1), idx + 1].join()]
            output << "#{pad}On the #{day} day of Christmas my true love gave to me: #{gifts}.\n"
            output
        end
    end
end
