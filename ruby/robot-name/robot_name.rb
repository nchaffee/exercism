class Robot
    AVAILABLE_NAMES = ('AA000'..'ZZ999').to_a.freeze

    def self.forget
        @@available_names = AVAILABLE_NAMES.dup.shuffle
    end
    forget

    def name
        @name ||= @@available_names.pop
    end

    def reset
        @name = nil
    end
end
