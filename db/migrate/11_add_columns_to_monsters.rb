class AddColumnsToMonsters < ActiveRecord::Migration[5.2]
    def change
        add_column :monsters, :game_id, :integer
    end
end
