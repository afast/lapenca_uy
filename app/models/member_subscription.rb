class MemberSubscription < ActiveRecord::Base
  belongs_to :member
  belongs_to :member_group
end
