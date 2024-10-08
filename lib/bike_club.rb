class BikeClub

  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
    @bikers
  end

  def most_rides
    max_rides = 0
    max_biker = nil

    @bikers.each do |biker|
      rides = 0
      biker.rides.each do |ride, times|
        rides += times.length
      end
      if rides > max_rides
        max_rides = rides
        max_biker = biker
      end
    end
    max_biker
  end

  def best_time(ride)
    @bikers.min_by do |biker|
      biker.personal_record(ride)
    end
  end

  def bikers_eligible(ride)
    eligible_bikers = @bikers.find_all do |biker|
      biker.acceptable_terrain.include?(ride.terrain) && ride.total_distance <= biker.max_distance
    end
    eligible_bikers
  end
end