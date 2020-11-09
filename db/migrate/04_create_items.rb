class CreateItems < ActiveRecord::Migration[6.0]
    def change
        create_table :items do |t|
            t.integer :money_up
            t.integer :power_up
            t.string :shop
            t.string :monster
            t.string :wisdom
            t.string :boss
            t.boolean :is_a_choice 
            t.integer :game_id
        end
    end
end