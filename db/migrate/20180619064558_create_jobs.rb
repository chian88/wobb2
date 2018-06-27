class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
    	t.string :title
    	t.text :description, :requirement
    	t.timestamps
    	t.integer :employer_id
    end
  end
end
