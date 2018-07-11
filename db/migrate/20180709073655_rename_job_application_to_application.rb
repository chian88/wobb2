class RenameJobApplicationToApplication < ActiveRecord::Migration[5.1]
  def change
  	rename_table :job_applications, :applications
  end
end
