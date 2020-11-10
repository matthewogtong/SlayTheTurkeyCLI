class AddColumnsToCharacters < ActiveRecord::Migration[5.2]
    def change
        add_column :characters, :is_alive, :boolean
    end
end