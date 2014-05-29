class AddPointsToMember < ActiveRecord::Migration
  def change
    add_column :members, :points, :integer
  end
end
