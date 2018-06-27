class CreateEmployers < ActiveRecord::Migration[5.1]
  def change
    create_table :employers do |t|
    	t.string :name
    	t.text :story
    	t.timestamps
    end
  end
end
