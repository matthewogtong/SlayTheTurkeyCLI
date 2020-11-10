class CreateDoors < ActiveRecord::Migration[5.2]
    def change
        create_table :doors do |t|
            t.string :riddle
            t.integer :answer
            t.boolean :solved
        end
    end
end