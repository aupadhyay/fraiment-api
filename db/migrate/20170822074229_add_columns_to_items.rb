class AddColumnsToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :name, :string
    add_column :items, :description, :string
    add_column :items, :size, :string
    add_column :items, :price, :decimal, :precision => 8, :scale => 2
  end
end
