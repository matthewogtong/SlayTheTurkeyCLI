class RemoveMoneyIsAliveFromCharacters < ActiveRecord::Migration[5.2]
    def change
        remove_column :characters, :money
        remove_column :characters, :is_alive
    end
end