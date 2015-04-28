module ElevatorOfAmericas
  class ElevatorBank
    FLOOR_RANGE = (1..25)
    FLOORS = FLOOR_RANGE.to_a
    MIN_ELEVATORS = 3

    attr_reader :elevator_count, :elevator_dispatcher, 
                :elevator_request_factory

    # Public: Initialize an elevator bank.
    #
    # elevator_dispatcher - applies routing strategies, must implement 
    #   next_elevator(2) 
    # elevator_factory - used to initialize elevators
    # elevator_request_factory - used to create elevator requests
    # size - Integer, number of elevators in the bank (must be at least 3)
    def initialize(elevator_dispatcher: ElevatorDispatcher,
                   elevator_factory: Elevator,
                   elevator_request_factory: ElevatorRequest,
                   size: MIN_ELEVATORS)
      @elevator_count = [size, MIN_ELEVATORS].max
      @elevators = (1..elevator_count).map do |_| 
        floor = Random.rand(FLOOR_RANGE)
        elevator_factory.new(floor)
      end
      @elevator_dispatcher = elevator_dispatcher
      @elevator_request_factory = elevator_request_factory
    end

    # Public: Dispatch an elevator.
    #
    # floor - Integer, number of the floor to send the elevator to
    # direction - Symbol, the direction the requester wants to go, :down or :up
    def dispatch_to(floor, direction)
      request = elevator_request_factory.new(floor, direction)
      elevator = elevator_dispatcher.next_elevator(@elevators, request)
      elevator.queue_stop(request)
    end

    def elevators
      status_message = "#{elevator_count} elevators \n"
      @elevators.each_with_index do |elevator, index|
        human_index = index + 1
        status_message << "Elevator #{human_index}: #{elevator}  \n"
      end
      puts status_message
    end
  end
end
