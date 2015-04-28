module ElevatorOfAmericas
  module Strategies
    class Base
      attr_reader :elevators, :request

      def self.elevator(elevators, request)
        new(elevators, request).elevator
      end

      # Public: Initializes a strategy
      #
      # elevators - Array, collections of elevators to apply strategy to
      # request - ElevatorRequest
      def initialize(elevators, request)
        @elevators = elevators
        @request = request
      end

      def elevator
        raise NoMethodError, "Elevator not defined for subclass"
      end
    end
  end
end
