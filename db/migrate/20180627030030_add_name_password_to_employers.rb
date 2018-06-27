class AddNamePasswordToEmployers < ActiveRecord::Migration[5.1]
  def change
  	add_column :employers, :password_digest, :string
  	add_column :employers, :email, :string
  end
end
