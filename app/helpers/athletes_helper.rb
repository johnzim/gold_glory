module AthletesHelper

  def seed_roster(user)
    @attr_male = {:name => "John Smith", :age => 1, :height => 1, :gender => "Male", :weight =>1, :skill => 1, :tps => 20}
    @attr_female = {:name => "Jane Doe",:age => 1, :height => 1, :gender => "Female", :weight =>1, :skill => 1, :tps => 20}
    
    10.times do
      @athlete = user.athletes.build(@attr_male)
      @athlete.save
    end
    
    10.times do
      @athlete = user.athletes.build(@attr_female)
      @athlete.save
    end
  end

  def tp_cost(athlete)

    #Athlete Skill Cost First
    if athlete.skill == 1
      @cost_tally = 20
    elsif athlete.skill == 2
      @cost_tally = 10
    else 
      @cost_tally = 50
    end

    #Next is Athlete weight
    @cost_tally
  end
    
end
