class RemoveAdminIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :admin_id, :integer
  end
end
