class DropDoorsItemsMonstersTables < ActiveRecord::Migration[5.2]
    def change
        drop_table :doors
        drop_table :items
        drop_table :monsters
    end
end