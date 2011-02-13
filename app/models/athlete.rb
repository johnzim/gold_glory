# == Schema Information
# Schema version: 20110209220407
#
# Table name: athletes
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  gender     :string(255)
#  age        :integer
#  height     :integer
#  weight     :integer
#  skill      :integer
#  power      :integer
#  speed      :integer
#  endurance  :integer
#  reflex     :integer
#  technique  :integer
#  mentality  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Athlete < ActiveRecord::Base

  belongs_to :user

end
