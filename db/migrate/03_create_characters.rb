class CreateCharacters < ActiveRecord::Migration[6.0]
    def change
        create_table :characters do |t|
            t.string :name
            t.integer :power
            t.integer :money
            t.integer :hp
        end
    end
end