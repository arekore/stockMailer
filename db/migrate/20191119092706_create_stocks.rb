class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :code
      t.integer :sendFlag

      t.timestamps
    end
  end
end
