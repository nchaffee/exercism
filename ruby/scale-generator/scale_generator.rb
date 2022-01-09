class Scale
    CHROMATIC = [["C"],["C#","Db"],["D"],["D#","Eb"],["E"],["F"],["F#","Gb"],["G"],["G#","Ab"],["A"],["A#","Bb"],["B"]]
    SHOW_FLATS = ["Bb minor","Eb mixolydian","G locrian","F chromatic","D harmonic_minor","Db hexatonic"]

    def initialize(tonic, name, steps = "m" * 12)
        @tonic, @name, @steps  = [tonic.capitalize, name, steps.chars.unshift("m")]
    end

    def name
        "%s %s" % [@tonic, @name]
    end

    def pitches
        scale = SHOW_FLATS.include?(name) ? CHROMATIC.map(&:last) : CHROMATIC.map(&:first)
        scale.rotate(scale.index(@tonic)).map do |note| #oops, no filter_map
            case @steps.shift
            when "M" then @steps.unshift("m"); next
            when "A" then @steps.unshift("M"); next
            else note
            end            
        end.compact
    end
end
