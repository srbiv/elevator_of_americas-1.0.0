module ElevatorOfAmericas
  class ElevatorDispatcher
    STRATAGIES = [Strategies::MostConvenient, Strategies::FewestStops] 

    attr_reader :elevators, :request, :strategies

    # Convenience class method for #next_elevator
    def self.next_elevator(elevators, request)
      new(elevators, request).next_elevator
    end
    
    # Public: Initialize an ElevatorDispatcher.
    #
    # elevators - Array, collection of elevators to apply strategies to
    # request - ElevatorRequest, request to get elevator for
    # strategies - Array, collection of strategies in the order they should be
    #   applied, strategies must respond to elevator(2)
    def initialize(elevators, request, strategies: STRATAGIES)
      @elevators = elevators
      @request = request
      @strategies = strategies
    end

    # Public: Elevator, returns the best elevator from the first strategy that
    # returns an elevator
    def next_elevator
      strategies.map { |strategy| strategy.elevator(elevators, request) }.first
    end
  end
end
