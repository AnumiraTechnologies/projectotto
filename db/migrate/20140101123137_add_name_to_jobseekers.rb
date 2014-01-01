class AddNameToJobseekers < ActiveRecord::Migration
  def change
    add_column :jobseekers, :name, :string
  end
end
