class AddIsAdminColumnToMembersTable < ActiveRecord::Migration
  def change
    add_column :members, :is_admin, :boolean, default: false
  end
end
