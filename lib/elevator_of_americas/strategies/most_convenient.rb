module ElevatorOfAmericas
  module Strategies
    class MostConvenient < Base
      attr_reader :elevators, :request

      # Public: Elevator, Sorts convenient elevators based on how far they are
      #  from the requested floor. See Elevator#convenient?(1) for a description
      #  on what "convenient" means.
      def elevator
        convient_elevators
          .sort_by { |e| e.distance(request) }
          .first
      end

      private

      def convient_elevators
        elevators.select { |elevator| elevator.convenient?(request) }
      end
    end
  end
end
