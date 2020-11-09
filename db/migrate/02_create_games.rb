class CreateGames < ActiveRecord::Migration[6.0]
    def change
        create_table :games do |t|
            t.integer :level_count
            t.integer :move_count
            t.boolean :game_won
            t.integer :user_id
            t.integer :character_id
        end
    end
end