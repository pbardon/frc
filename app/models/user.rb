# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  email      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  
  has_many :contacts
  has_many :contact_shares
  
  has_many :comments, as: :commentable 
  
  has_many :shared_contacts, through: :contact_shares, source: :contact
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  def all_contacts
    self.contacts + self.shared_contacts
  end
  
end
