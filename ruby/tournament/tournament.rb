class Tournament
    attr_accessor :teams
    def initialize(input)
        @matches = input.split("\n")
        @teams = []
    end

    def find_team(name)
        if @teams.none? {|team| team.name == name}
            @teams.push(Team.new(name))
        end
        @teams.find{|team| team.name == name}
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

    def self.tally(input)
        tournament = Tournament.new(input)
        tournament.tally
        Table.new(tournament).to_s
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
        def initialize(tournament)
            @teams = tournament.teams
        end

        def to_s
            output = table_line(["Team","MP","W","D","L","P"])
            if @teams.any?
                sorted_teams = @teams.sort_by{|team| [(team.points * -1), team.name]}
                sorted_teams.each do |team|
                    columns = [team.name, team.played, team.wins, team.draws, team.losses, team.points].map(&:to_s)
                    output << table_line(columns)
                end
            end
            output
        end

        private
        def table_line(columns)
            sprintf("%-31s|%3s |%3s |%3s |%3s |%3s\n" % columns)
        end
    end
end
