class RemoveColumnsFromGames < ActiveRecord::Migration[5.2]
    def change
        remove_column :games, :monster_id
        remove_column :games, :door_id
    end
end
