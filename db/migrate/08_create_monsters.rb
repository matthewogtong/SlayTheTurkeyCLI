class CreateMonsters < ActiveRecord::Migration[5.2]
    def change
        create_table :monsters do |t|
            t.string :name
            t.integer :power
            t.integer :hp
            t.boolean :is_alive
        end
    end
end