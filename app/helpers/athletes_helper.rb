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

    athlete.power = statroll(@skill)
    athlete.speed = statroll(@skill)
    athlete.endurance = statroll(@skill)
    athlete.reflex = statroll(@skill)
    athlete.technique = statroll(@skill)
    athlete.mentality = statroll(@skill)


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
