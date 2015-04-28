module ElevatorOfAmericas
  class ElevatorRequest
    attr_reader :floor, :direction

    # Public: Initialize an elevator request.
    #
    # floor - Integer, number of the floor the elevator should go to
    # direction - The direction the elevator will travel after stopping at the 
    #   floor
    def initialize(floor, direction)
      @floor = floor
      @direction = direction
    end
  end
end
