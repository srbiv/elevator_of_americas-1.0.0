module ElevatorOfAmericas
  module Strategies
    class FewestStops < Base
      attr_reader :elevators, :request

      # Public: Elevator, Sorts elevators based on the number of stops they 
      #   have
      def elevator
        elevators.sort_by { |e| e.stop_count }.first
      end
    end
  end
end
