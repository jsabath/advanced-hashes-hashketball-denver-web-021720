require 'pry'
def game_hash
    {
      away: { team_name: 'Charlotte Hornets',
              colors: ["Turquoise", "Purple"],
              players: [
                { player_name: 'Jeff Adrien',
                  number: 4,
                  shoe: 18,
                  points: 10,
                  rebounds: 1,
                  assists: 1,
                  steals: 2,
                  blocks: 7,
                  slam_dunks: 2 },
                { player_name: 'Bismack Biyombo',
                  number: 0,
                  shoe: 16,
                  points: 12,
                  rebounds: 4,
                  assists: 7,
                  steals: 22,
                  blocks: 15,
                  slam_dunks: 10 },
                { player_name: 'DeSagna Diop',
                  number: 2,
                  shoe: 14,
                  points: 24,
                  rebounds: 12,
                  assists: 12,
                  steals: 4,
                  blocks: 5,
                  slam_dunks: 5 },
                { player_name: 'Ben Gordon',
                  number: 8,
                  shoe: 15,
                  points: 33,
                  rebounds: 3,
                  assists: 2,
                  steals: 1,
                  blocks: 1,
                  slam_dunks: 0 },
                { player_name: 'Kemba Walker',
                  number: 33,
                  shoe: 15,
                  points: 6,
                  rebounds: 12,
                  assists: 12,
                  steals: 7,
                  blocks: 5,
                  slam_dunks: 12 }
              ] },
      home: { team_name: 'Brooklyn Nets',
              colors: ["Black", "White"],
              players: [
                { player_name: 'Alan Anderson',
                  number: 0,
                  shoe: 16,
                  points: 22,
                  rebounds: 12,
                  assists: 12,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 1 },
                { player_name: 'Reggie Evans',
                  number: 30,
                  shoe: 14,
                  points: 12,
                  rebounds: 12,
                  assists: 12,
                  steals: 12,
                  blocks: 12,
                  slam_dunks: 7 },
                { player_name: 'Brook Lopez',
                  number: 11,
                  shoe: 17,
                  points: 17,
                  rebounds: 19,
                  assists: 10,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 15 },
                { player_name: 'Mason Plumlee',
                  number: 1,
                  shoe: 19,
                  points: 26,
                  rebounds: 11,
                  assists: 6,
                  steals: 3,
                  blocks: 8,
                  slam_dunks: 5 },
                { player_name: 'Jason Terry',
                  number: 31,
                  shoe: 15,
                  points: 19,
                  rebounds: 2,
                  assists: 2,
                  steals: 4,
                  blocks: 11,
                  slam_dunks: 1 }
              ] }
    }
end

def players
    game_hash[:away][:players].concat {game_hash[:home][:players]}
end

def find_player(name)
  players.find do |player|
    player[:player_name] == name
  end
  def teams 
    game_hash.values
  end

def num_points_scored(name)
  find_player(name)[:points]
end

def shoe_size (name)
  find_player(name)[:shoes]
end

def team_colors(name)
   teams.find do |team|
    team[:team_name] == name
  end[:colors]
end

def team_names
  teams.map do |team|
    team[:team_name]
end

def player_numbers(team)
    
    
end


  def hoaTEAM(team)
    team == game_hash[:home][:team_name]? "home" : "away"
  end
  def hoaPlayer(player)
  game_hash[:home][:players].find {|n|n[:player_name]==player} != nil ? "home" : "away"
  end
  puts hoaPlayer("Alan Anderson")
  
  def player_stats(team)
  hoa = hoaTeam(team)
  rvariable = game_hash[hoa.to_sym][:players]
  return rvariable
  end
  
  def big_shoe_rebounds
    biggest_shoe = 0
    num_rebounds = 0
    game_hash.each do |_team, game_data|
      game_data[:players].each do |player|
        if player[:shoe] > biggest_shoe
          biggest_shoe = player[:shoe]
          num_rebounds = player[:rebounds]
        end
      end
    end
    num_rebounds
  end
  
  # # Bonus Questions
  def iterate_through_players_for(name, statistic)
    game_hash.each do |_team, game_data|
      game_data[:players].each do |player|
        return player[statistic] if player[:player_name] == name
      end
    end
  end
  
  def player_with_most_of(statistic)
    player_name = nil
    amount_of_stat = 0
  
    game_hash.each do |_team, game_data|
      game_data[:players].each do |player|
        if player[statistic].is_a? String
          if player[statistic].length > amount_of_stat
            amount_of_stat = player[statistic].length
            player_name = player[:player_name]
          end
        elsif player[statistic] > amount_of_stat
          amount_of_stat = player[statistic]
          player_name = player[:player_name]
        end
      end
    end
  
    player_name
  end
  
  def most_points_scored
    player_with_most_of(:points)
  end
  
  def winning_team
    scores = { 'Brooklyn Nets' => 0, 'Charlotte Hornets' => 0 }
    game_hash.each do |_team, game_data|
      game_data[:players].each do |player|
        scores[game_data[:team_name]] += iterate_through_players_for(player[:player_name], :points)
      end
    end
    scores.max_by { |_k, v| v }.first
  end
  
  def player_with_longest_name
    player_with_most_of(:player_name)
  end
  
  # # Super Bonus Question
  def long_name_steals_a_ton?
    player_with_most_of(:steals) == player_with_most_of(:player_name)
  end