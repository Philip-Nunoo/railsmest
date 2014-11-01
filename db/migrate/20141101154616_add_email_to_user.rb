class AddEmailToUser < ActiveRecord::Migration
  def change
  	add_column :users, :email, :string, column_options: {null: false}
  end
end
