class AddProviderToJobseekers < ActiveRecord::Migration
  def change
    add_column :jobseekers, :provider, :string
    add_column :jobseekers, :uid, :string
  end
end
