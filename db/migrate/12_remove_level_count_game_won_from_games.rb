class RemoveLevelCountGameWonFromGames< ActiveRecord::Migration[5.2]
    def change
        remove_column :games, :level_count
        remove_column :games, :game_won
    end
end