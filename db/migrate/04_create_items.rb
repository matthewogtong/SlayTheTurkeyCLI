class CreateItems < ActiveRecord::Migration[5.2]
    def change
        create_table :items do |t|
            t.string :name
            t.integer :money_up
            t.integer :power_up
            t.string :wisdom 
            t.integer :game_id
        end
    end
end