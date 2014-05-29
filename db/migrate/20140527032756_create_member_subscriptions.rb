class CreateMemberSubscriptions < ActiveRecord::Migration
  def change
    create_table :member_subscriptions do |t|
      t.references :member
      t.references :member_group

      t.timestamps
    end

    add_index :member_subscriptions, :member_id
    add_index :member_subscriptions, :member_group_id
    add_index :member_subscriptions, [:member_group_id, :member_id]
  end
end
