class AddColumnsToGames < ActiveRecord::Migration[5.2]
    def change
        add_column :games, :monster_id, :integer
        add_column :games, :door_id, :integer
    end
end
