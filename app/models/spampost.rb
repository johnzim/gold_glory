# == Schema Information
# Schema version: 20110208195118
#
# Table name: spamposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Spampost < ActiveRecord::Base
  
  attr_accessible :content

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  default_scope :order => 'spamposts.created_at DESC'
end
