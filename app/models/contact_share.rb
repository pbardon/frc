# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#

class ContactShare < ActiveRecord::Base
  
  belongs_to(:contact)
  belongs_to(:user)
  
 
  validates :contact_id, presence: true
  validates :user_id, presence: true
  validates :contact_id, presence: true, :uniqueness => {:scope => :user_id}
  
  
end
