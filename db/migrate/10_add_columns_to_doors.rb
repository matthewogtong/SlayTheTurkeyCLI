class AddColumnsToDoors < ActiveRecord::Migration[5.2]
    def change
        add_column :doors, :game_id, :integer
    end
end
