class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :mail
      t.integer :sendFlag

      t.timestamps
    end
  end
end
