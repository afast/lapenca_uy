class MemberGroup < ActiveRecord::Base
  has_many :member_subscriptions
  has_many :members, through: :member_subscriptions
end
