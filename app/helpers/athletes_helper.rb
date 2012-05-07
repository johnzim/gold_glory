module AthletesHelper

  def seed_roster(user)
    @attr_male = {:first_name => "John", :name => "Smith", :age => 1, :height => 1, :gender => "Male", :weight =>1, :skill => 1, :tps => 20}
    @attr_female = {:first_name => "Jane", :name => "Doe",:age => 1, :height => 1, :gender => "Female", :weight =>1, :skill => 1, :tps => 20}
    
    10.times do
      @athlete = user.athletes.build(@attr_male)
      @rand = (1+ rand(89))

      @athlete.iconno = @rand
      @athlete.save
    end
    
    10.times do
      @athlete = user.athletes.build(@attr_female)
      @rand = (1+ rand(89))

      @athlete.iconno = @rand
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


  def calculate_stats(athlete)

    @skill = athlete.skill
	@height = athlete.height

	athlete.true_age = ageroll(@age)

    athlete.power = statroll(@skill)
    athlete.speed = statroll(@skill)
    athlete.endurance = statroll(@skill)
    athlete.reflex = statroll(@skill)
    athlete.technique = statroll(@skill)
    athlete.mentality = statroll(@skill)
    
    
    if athlete.gender == "Male"
	    athlete.true_height = heightrollmale(@height)
		athlete.true_weight = weightrollmale(@weight)

	else
	    athlete.true_height = heightrollfemale(@height)
		athlete.true_weight = weightrollfemale(@weight)
	end

    athlete = moderate_stats(@skill, athlete)


    athlete.save
  end


  def moderate_stats(skill, athlete)

    @stattotal = athlete.power + athlete.speed + athlete.endurance + athlete.reflex + athlete.technique + athlete.mentality

    if skill == 3
      if @stattotal < 40
        @shortfall = 40 - @stattotal
        @shortfall.times do
          athlete = increment_stat(athlete)
        end 
        
      elsif @stattotal > 45
        @overshoot = @stattotal - 45
        @overshoot.times do
          athlete = decrement_stat(athlete)
        end
      end
    
    elsif skill == 1
      if @stattotal < 23
        @shortfall = 23 - @stattotal
        @shortfall.times do
          athlete = increment_stat(athlete)
        end 
        
      elsif @stattotal > 27
        @overshoot = @stattotal - 27
        @overshoot.times do
          athlete = decrement_stat(athlete)
        end
      end
    
    
    else 
      if @stattotal < 12
        @shortfall = 12 - @stattotal
        @shortfall.times do
          athlete = increment_stat(athlete)
        end 
        
      elsif @stattotal > 18
        @overshoot = @stattotal - 18
        @overshoot.times do
          athlete = decrement_stat(athlete)
        end
      end
    end
    athlete
  end
  
  def increment_stat(athlete)
    @incrementroll = rand(6)
    
    if @incrementroll == 0
      athlete.power += 1
    elsif @incrementroll == 1
      athlete.speed += 1
    elsif @incrementroll == 2
      athlete.endurance += 1
    elsif @incrementroll == 3
      athlete.reflex += 1
    elsif @incrementroll == 4
      athlete.technique += 1
    elsif @incrementroll == 5
      athlete.mentality += 1
    end
    
    athlete
  end
  
  def decrement_stat(athlete)
    @decrementroll = rand(6)
    
    if @decrementroll == 0
      if athlete.power > 1 
        athlete.power -= 1
      else
        athlete = decrement_stat(athlete)
      end
    elsif @decrementroll == 1
      if athlete.speed > 1 
        athlete.speed -= 1
      else
        athlete = decrement_stat(athlete)
      end    
    elsif @decrementroll == 2
      if athlete.endurance > 1 
        athlete.endurance -= 1
      else
        athlete = decrement_stat(athlete)
      end
    elsif @decrementroll == 3
      if athlete.reflex > 1 
        athlete.reflex -= 1
      else
        athlete = decrement_stat(athlete)
      end    
    elsif @decrementroll == 4
      if athlete.technique > 1 
        athlete.technique -= 1
      else
        athlete = decrement_stat(athlete)
      end   
    elsif @decrementroll == 5
      if athlete.mentality > 1 
        athlete.mentality -= 1
      else
        athlete = decrement_stat(athlete)
      end 
    end

    athlete
  end
  
  
  
  
def ageroll(age)

#1-normal 2-old 3-young
  @roll = rand(100)
  	
  	if age == 3
  		if @roll > 90
  			@stat = 19
  		elsif @roll > 70
  			@stat = 18
  		elsif @roll > 45
  			@stat = 17
  		elsif @roll > 20
  			@stat = 16
  		elsif @roll > 10
  			@stat = 15
  		elsif @roll > 5
  			@stat = 14
  		else 
  			@stat = 13
  		end
  			
  	elsif age == 2
  		if @roll > 95
  			@stat = 35
  		elsif @roll > 90
  			@stat = 34
  		elsif @roll > 80
  			@stat = 33
  		elsif @roll > 55
  			@stat = 32
  		elsif @roll > 30
  			@stat = 31
  		elsif @roll > 20
  			@stat = 30
  		elsif @roll > 10
  			@stat = 29
  		else
  			@stat = 28
  		end
  	  		
  	else
  		if @roll > 95
  			@stat = 27
  		elsif @roll > 88
  			@stat = 26
  		elsif @roll > 81
  			@stat = 25
  		elsif @roll > 74
  			@stat = 24
  		elsif @roll > 62
  			@stat = 23
  		elsif @roll > 38
  			@stat = 22
  		elsif @roll > 26
  			@stat = 21
  		elsif @roll > 19
  			@stat = 20
  		elsif @roll > 12
  			@stat = 19
  		elsif @roll > 5
  			@stat = 18
  		else 
  			@stat = 17
  			
  		end

	end
	@stat
end

  
  
  
    
  def weightrollmale(weight)
  	@roll = rand(100)
  	@d6roll = rand(6)
  	@d4roll = rand(4)
 
 
 #1normal 2light 3heavy
  	
  	if weight == 1
  		if @roll > 90
  			@stat = 95 + @d6roll
  			
  		elsif @roll > 80
  			@stat = 93 + @d4roll
  			
   		elsif @roll > 70
  			@stat = 88 + @d6roll
  		
  		elsif @roll > 60
  			@stat = 82 + @d4roll
  		
  		elsif @roll > 50
  			@stat = 78 + @d6roll
  		
  		elsif @roll > 40
  			@stat = 75 + @d6roll
  		
  		elsif @roll > 30
  			@stat = 72 + @d6roll
		
		elsif @roll > 20
  		  	@stat = 69 + @d4roll

  		elsif @roll > 10
    		@stat = 70 - @d4roll
		
  		else
  			@stat = 70 - @d4roll

  		end
  	
  	elsif weight == 2
  
		if @d6roll > 4
  			@stat = (70 - rand(20))
  			
  		elsif @d6roll > 2
  			@stat = 70 - rand(6) - rand(6)
  			
   		else
  			@stat = 7- rand(4) - @d4roll
  		
  		end	
  	
  	else
  	
  		if @d6roll > 4
  			@stat = 100 + rand(10)
  			
  		elsif @d6roll > 2
  			@stat = 95 + rand(12)
  			
   		else
  			@stat = 90 + rand(4) + rand(4) + rand(4) + @d4roll
  		
  		end			
  	
  	end
  	
  	@stat
  end
  
  
 
 
  
    
  def weightrollfemale(weight)
  	@roll = rand(100)
  	@d6roll = rand(6)
  	@d4roll = rand(4)
 
 
 #1normal 2light 3heavy
  	
  	if weight == 1
  		if @roll > 90
  			@stat = 69 + @d4roll
  			
  		elsif @roll > 80
  			@stat = 69 + rand(3)
  			
   		elsif @roll > 70
  			@stat = 66 + rand(3)
  		
  		elsif @roll > 60
  			@stat = 62 + @d4roll
  		
  		elsif @roll > 50
  			@stat = 60 + @d4roll
  		
  		elsif @roll > 40
  			@stat = 59 + @d4roll
  		
  		elsif @roll > 30
  			@stat = 58 + @d4roll
		
		elsif @roll > 20
  		  	@stat = 57 + rand(3)

  		elsif @roll > 10
    		@stat = 58 - rand(3)
		
  		else
  			@stat = 58 - @d4roll

  		end
  	
  	elsif weight == 2
  
		if @d6roll > 4
  			@stat = (58 - rand(12) - rand(8))
  			
  		elsif @d6roll > 2
  			@stat = 58 - rand(6) - rand(6)
  			
   		else
  			@stat = 58- rand(3) - rand(3)
  		
  		end	
  	
  	else
  	
  		if @d6roll > 4
  			@stat = 77 + rand(8)
  			
  		elsif @d6roll > 2
  			@stat = 73 + rand(8)
  			
   		else
  			@stat = 69 + rand(8)
  		
  		end			
  	
  	end
  	
  	@stat
  end
  

  	
    
  def heightrollfemale(height)
  	@roll = rand(100)
  	
  	if height == 3
  		if @roll > 90
  			@stat = 193
  		elsif @roll > 80
  			@stat = 190
  		elsif @roll > 70
  			@stat = 188
  		elsif @roll > 40
  			@stat = 185
  		elsif @roll > 20
  			@stat = 183
  		elsif @roll > 10
  			@stat = 180
  		else 
  			@stat = 178
  		end
  			
  	elsif height == 2
  		if @roll > 90
  			@stat = 163
  		elsif @roll > 80
  			@stat = 160
  		elsif @roll > 70
  			@stat = 157
  		elsif @roll > 60
  			@stat = 155
  		elsif @roll > 35
  			@stat = 152
  		elsif @roll > 15
  			@stat = 150
  		elsif @roll > 5
  			@stat = 147
  		else
  			@stat = 145
  		end
  	  		
  	else
  		if @roll > 95
  			@stat = 180
  		elsif @roll > 90
  			@stat = 178
  		elsif @roll > 80
  			@stat = 175
  		elsif @roll > 65
  			@stat = 172
  		elsif @roll > 45
  			@stat = 170
  		elsif @roll > 15
  			@stat = 168
  		elsif @roll > 10
  			@stat = 165
  		elsif @roll > 5
  			@stat = 163
  		else 
  			@stat = 160
  			
  		end

	end
	@stat
end
  
  def heightrollmale(height)
  	@roll = rand(100)
  	
  	if height == 3
  		if @roll > 90
  			@stat = 206
  		elsif @roll > 80
  			@stat = 203
  		elsif @roll > 70
  			@stat = 201
  		elsif @roll > 40
  			@stat = 198
  		elsif @roll > 20
  			@stat = 196
  		elsif @roll > 10
  			@stat = 193
  		else 
  			@stat = 190
  		end
  			
  	elsif height == 2
  		if @roll > 90
  			@stat = 175
  		elsif @roll > 80
  			@stat = 173
  		elsif @roll > 70
  			@stat = 170
  		elsif @roll > 60
  			@stat = 168
  		elsif @roll > 35
  			@stat = 165
  		elsif @roll > 15
  			@stat = 163
  		elsif @roll > 5
  			@stat = 160
  		else
  			@stat = 157
  		end
  	  		
  	else
  		if @roll > 95
  			@stat = 193
  		elsif @roll > 90
  			@stat = 190
  		elsif @roll > 80
  			@stat = 188
  		elsif @roll > 65
  			@stat = 185
  		elsif @roll > 45
  			@stat = 183
  		elsif @roll > 15
  			@stat = 180
  		elsif @roll > 10
  			@stat = 178
  		elsif @roll > 5
  			@stat = 175
  		else 
  			@stat = 173
  			
  		end

	end
	@stat
end
  	
  	
  		
  		
  
  def statroll(skill)
    @roll = rand(100)
    
    if skill == 3
      if @roll <= 5
        @stat = 5
      elsif @roll <= 25 
        @stat = 6
      elsif @roll <= 75 
        @stat = 7
      elsif @roll <= 95 
        @stat = 8
      else 
        @stat = 9
      end

    elsif skill == 1
      if @roll <= 5
        @stat = 1
      elsif @roll <= 15
        @stat = 2
      elsif @roll <= 30
        @stat = 3
      elsif @roll <= 60
        @stat = 4
      elsif @roll <= 80
        @stat = 5 
      elsif @roll <= 90
        @stat = 6      
      elsif @roll <= 95
        @stat = 7
      else
        @stat = 8
      end

    else 
      if @roll <= 20
        @stat = 1
      elsif @roll <= 50
        @stat = 2
      elsif @roll <= 80
        @stat = 3
      elsif @roll <= 90
        @stat = 4
      else
        @stat = 5 
      end
      
      @stat
    end
  end

  


end
