module ElevatorOfAmericas
  class Elevator
    attr_reader :destination, :current_floor, :stops, :current_direction

    # Public: Initialize an elevator.
    #
    # floor - Integer, number of the floor to the elevator will start on
    # current_direction - Symbol, defaults to :idle, :up and :down are also valid
    def initialize(floor, current_direction: :idle)
      @current_floor = floor
      @current_direction = current_direction
      @stops = []
    end

    # Public: Integer, number of stops the elevator has queued
    def stop_count
      stops.size
    end

    # Public: Adds a stop to the elevator's queue
    #
    # request - ElevatorRequest
    def queue_stop(request)
      @stops << request
      set_current_direction
    end

    # Public: Is it convenient for the elevator to answer the request?
    #
    # This returns true when the elevator is idle or is traveling past the
    # floor that requested the stop and is traveling in the direction the call 
    # requested.
    #
    # request - ElevatorRequest
    def convenient?(request)
      return true if idle?
      if request.direction == current_direction
        if going_up?
          request.floor >= current_floor
        else
          request.floor <= current_floor
        end
      else
        false
      end
    end

    # Public: Integer, distance elevator is from a ElevatorRequest's floor
    #
    # request - ElevatorRequest
    def distance(request)
      (request.floor - current_floor).abs
    end

    def to_s
      "Current floor: #{current_floor},  Traveling: #{current_direction}"
    end

    private

    def next_stop
      stops.first
    end

    def idle?
      current_direction == :idle
    end

    def going_down?
      current_direction == :down
    end

    def going_up?
      current_direction == :up
    end
  end
end
