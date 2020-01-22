class RenameUpdateToUpdateAccess < ActiveRecord::Migration[6.0]
  def change
    rename_column :project_users, :update, :update_access
  end
end
