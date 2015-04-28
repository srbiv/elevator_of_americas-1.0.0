require "spec_helper"

describe ElevatorOfAmericas::Strategies::FewestStops do
  subject(:fewest_stops) { described_class.new(elevators, request) }

  let(:request) { double('Request') }
  let(:elevators) { [elevator_1, elevator_2, elevator_3, elevator_4, elevator_5] }
  let(:elevator_1) { double('Elevator', stop_count: 1) }
  let(:elevator_2) { double('Elevator', stop_count: 1) }
  let(:elevator_3) { double('Elevator', stop_count: 2) }
  let(:elevator_4) { double('Elevator', stop_count: 3) }
  let(:elevator_5) { double('Elevator', stop_count: 4) }

  describe "#elevator" do
    subject(:elevator) { fewest_stops.elevator }

    it { is_expected.to eq(elevator_1) }
  end
end
