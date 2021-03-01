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
        "twelve Drummers Drumming",
        "eleven Pipers Piping",
        "ten Lords-a-Leaping",
        "nine Ladies Dancing",
        "eight Maids-a-Milking",
        "seven Swans-a-Swimming",
        "six Geese-a-Laying",
        "five Gold Rings",
        "four Calling Birds",
        "three French Hens",
        "two Turtle Doves",
        "a Partridge in a Pear Tree"
    ]

    def self.song
        DAYS.each_with_index.inject("") do |output, (day, idx)|
            gifts_for_this_day = GIFTS[(GIFTS.length - idx - 1), GIFTS.length]
            last_gift = gifts_for_this_day.pop + "."
            last_gift = "and " + last_gift if gifts_for_this_day.any?
            gifts = gifts_for_this_day.push(last_gift).join(", ")
            output << "\n\n" if idx > 0
            output << "On the #{day} day of Christmas my true love gave to me: #{gifts}"
            output
        end + "\n"
    end
end
