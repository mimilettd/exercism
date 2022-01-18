=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament
  def self.tally(input)
    new(input).tally
  end

  def initialize(input)
    @input = input
  end

  def tally
    write_header + write_lines.join
  end

  private

  attr_reader :input

  def write_header
    columns.map do |_,g|
      if g[:label] == "Team"
        g[:label].ljust(g[:width])
      else
        g[:label].rjust(g[:width])
      end
    end.join(' | ') + "\n"
  end

  def write_lines
    sorted_match_results.map do |result|
      write_line(result)
    end
  end

  def write_line(h)
    h.keys.map do |k|
      if k == "name"
        h[k].to_s.ljust(columns[k][:width])
      else
        h[k].to_s.rjust(columns[k][:width])
      end
    end.join(" | ") + "\n"
  end

  def header
    {
      'name' => 'Team',
      'MP' => 'MP',
      'W' => 'W',
      'D' => 'D',
      'L' => 'L',
      'P' => 'P'
    }
  end

  def columns
    @columns ||= header.each_with_object({}) do |(col, label), h|
      h[col] = if label == 'Team'
                 {
                   label: label,
                   width: 30
                 }
               else
                 {
                   label: label,
                   width: 2
                 }
               end
    end
  end

 def sorted_match_results
   match_results.sort_by { |result| [-result['P'], result['name']] }
 end

  def match_results
    tournament_hash = matches.map do |match|
      Match.tally(match)
    end

    grouped = tournament_hash.flatten.group_by { |h| h['name'] }

    grouped.map do |team|
      team[1].reduce do |result, match|
        result["MP"] += match["MP"]
        result["W"] += match["W"]
        result["D"] += match["D"]
        result["L"] += match["L"]
        result["P"] += match["P"]
        result
      end
    end
  end

  def matches
    input.chomp.split("\n")
  end

  class Match
    def self.tally(match)
      new(match).tally
    end

    def initialize(match)
      @match = match.chomp.split(';')
    end

    def tally
      [home_team, visiting_team].map do |team_attrs|
        {
          'name' => team_attrs[:name],
          'MP' => 1,
          'W' => team_attrs[:outcome] == 'win' ? 1 : 0,
          'D' => team_attrs[:outcome] == 'draw' ? 1 : 0,
          'L' => team_attrs[:outcome] == 'loss' ? 1 : 0,
          'P' => point_system[team_attrs[:outcome]]
        }
      end
    end

    private

    attr_reader :match

    def home_team
      {
        name: match[0],
        outcome: home_team_outcome
      }
    end

    def visiting_team
      {
        name: match[1],
        outcome: visiting_team_outcome
      }
    end

    def home_team_outcome
      @match_outcome ||= match[2]
    end

    def visiting_team_outcome
      case home_team_outcome
      when 'win'
        'loss'
      when 'loss'
        'win'
      when 'draw'
        'draw'
      end
    end

    def point_system
      {
        'win' => 3,
        'draw' => 1,
        'loss' => 0
      }
    end
  end
end
