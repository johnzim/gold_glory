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
	if athlete.weight == 2 
	    @cost_tally += 5
	elsif athlete.weight == 3
		@cost_tally -= 5
	end
	
	# then Athlete height
	if athlete.height == 3 
	    @cost_tally += 5
	elsif athlete.height == 2
		@cost_tally -= 5
	end
	
	
	# then Athlete age
	if athlete.age == 3
	    @cost_tally += 5
	elsif athlete.age == 2
		@cost_tally -= 5
	end
	
	@cost_tally
  end
  
  def tp_penalty(athlete)
   # Athlete weight
   
   	@penalty_tally = 0
   
	if athlete.weight == 3		
		@penalty_tally += 5
	end
	
	# then Athlete height
	if athlete.height == 2
		@penalty_tally += 5
	end
	
	
	# then Athlete age
	if athlete.age == 2
		@penalty_tally += 5
	end
	
	@penalty_tally
  end
	
  	
    
end
