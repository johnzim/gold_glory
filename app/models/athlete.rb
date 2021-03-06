# == Schema Information
# Schema version: 20110327120450
#
# Table name: athletes
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  gender      :string(255)
#  age         :integer
#  height      :integer
#  weight      :integer
#  skill       :integer
#  power       :integer
#  speed       :integer
#  endurance   :integer
#  reflex      :integer
#  technique   :integer
#  mentality   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  tps         :integer
#  penalty_tps :integer
#  first_name  :string(255)
#  iconno      :integer
#  true_height :integer
#

class Athlete < ActiveRecord::Base

  belongs_to :user

end
