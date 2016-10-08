class AddInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birth, :string
    add_column :users, :from, :string
    add_column :users, :work_at, :string
  end
end
