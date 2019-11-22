class AddColumnUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lastSend, :datetime
  end
end
