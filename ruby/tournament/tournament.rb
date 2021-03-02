class Tournament
    attr_accessor :teams
    def initialize(input)
        @matches = input.split("\n")
        @teams = []
    end

    def self.tally(input)
        tournament = Tournament.new(input)
        tournament.tally
        Table.new(tournament).to_s
    end

    def tally
        @matches.each do |match|
            name1,name2,result = match.split(";")
            team1, team2 = find_team(name1), find_team(name2)
            case result
            when "win"
                team1.win
                team2.loss
            when "loss"
                team1.loss
                team2.win
            when "draw"
                team1.draw
                team2.draw
            end
        end
    end

    def find_team(name)
        init_team(name) unless team_exists?(name)
        @teams.find{|team| team.name == name}
    end

    def init_team(name)
        @teams.push(Team.new(name))
    end

    def team_exists?(name)
        @teams.any? {|team| team.name == name}
    end

    class Team
        attr_reader :name, :played, :wins, :losses, :draws, :points
        def initialize(name)
            @name = name
            @wins = @losses = @draws = @points = @played = 0
        end

        def win
            @played += 1
            @wins += 1
            @points += 3
        end

        def loss
            @played += 1
            @losses += 1
        end

        def draw
            @played += 1
            @draws += 1
            @points += 1
        end
    end

    class Table
        TABLE_LINE = "%-30s | %2s | %2s | %2s | %2s | %2s\n"
        HEADER = TABLE_LINE % ["Team","MP","W","D","L","P"]

        def initialize(tournament)
            @teams = tournament.teams
        end

        def to_s
            @teams.none? ?
                HEADER
                :
                HEADER + @teams.
                    sort_by{|team| [(-team.points), team.name]}.
                    map do |team|
                        TABLE_LINE % [
                            team.name,
                            team.played,
                            team.wins,
                            team.draws,
                            team.losses,
                            team.points
                        ].map(&:to_s)
                    end.join()
        end
    end
end
