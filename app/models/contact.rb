# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  email      :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  
  belongs_to( :owner,
              class_name: 'User',
              foreign_key: :user_id)
              
  has_many :contact_shares
  
  has_many :comments, as: :commentable
  
  has_many :shared_users, through: :contact_shares, source: :user
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  
  
  validates :email, :presence => true, :uniqueness => {:scope => :user_id}
  
  def self.contacts_for_user_id(user_id)
    Contact.find_by_sql([<<-SQL, user_id])
    SELECT
      contacts.*
    FROM
      contacts
    LEFT OUTER JOIN
      contact_shares ON contacts.id = contact_shares.contact_id
    WHERE
      contacts.user_id = (?)
    SQL
  end
end
