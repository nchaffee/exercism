class Tournament
    def self.tally(input)
        matches = input.split("\n")
        teams = []
        if matches.any?
            matches.each do |match|
                team_name1,team_name2,result = match.split(";")
                #set up teams
                [team_name1,team_name2].each do |name|
                    if teams.none? {|team| team.name == name}
                        teams.push(Team.new(name))
                    end
                end
                # record scores
                team1 = teams.select{|team| team.name == team_name1}.first
                team2 = teams.select{|team| team.name == team_name2}.first
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
        # output table
        Table.new(teams).to_s
    end

    class Team
        attr_reader :name, :played, :wins, :losses, :draws, :points
        def initialize(name)
            @name = name
            @wins = 0
            @losses = 0
            @draws = 0
            @points = 0
            @played = 0
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
        def initialize(teams)
            @teams = teams
            @output = ""
        end

        def to_s
            @output << header
            if @teams.any?
                # puts "@teams: #{@teams}"
                sorted_teams = @teams.sort_by{|team| [(team.points * -1), team.name]}
                # puts "sorted_teams: #{sorted_teams}"
                sorted_teams.each do |team|
                    @output << sprintf(
                        "%-31s|%3d |%3d |%3d |%3d |%3d\n" %
                        [team.name, team.played, team.wins, team.draws, team.losses, team.points]
                    )
                end
            end
           @output
        end

        def header
            "Team                           | MP |  W |  D |  L |  P\n"
        end
    end
end
