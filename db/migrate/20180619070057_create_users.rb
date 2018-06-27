class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :name, :email, :password_digest
    	t.text :summary
    	t.timestamps
    end
  end
end
