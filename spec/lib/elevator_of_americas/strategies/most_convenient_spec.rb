require "spec_helper"

describe ElevatorOfAmericas::Strategies::MostConvenient do
  subject(:most_convenient) { described_class.new(elevators, request) }

  let(:elevators) { [elevator_1, elevator_2, elevator_3, elevator_4, elevator_5] }
  let(:elevator_1) { ElevatorOfAmericas::Elevator.new(3,  current_direction: :idle) }
  let(:elevator_2) { ElevatorOfAmericas::Elevator.new(13,  current_direction: :down) }
  let(:elevator_3) { ElevatorOfAmericas::Elevator.new(14,  current_direction: :up) }
  let(:elevator_4) { ElevatorOfAmericas::Elevator.new(25,  current_direction: :down) }
  let(:elevator_5) { ElevatorOfAmericas::Elevator.new(1,  current_direction: :up) }

  describe "#elevator" do
    subject(:elevator) { most_convenient.elevator }

    context "1st floor going up" do
      let(:request) { ElevatorOfAmericas::ElevatorRequest.new(1, :up) }      
      it { is_expected.to eq(elevator_5) }
    end

    context "25th floor going down" do
      let(:request) { ElevatorOfAmericas::ElevatorRequest.new(25, :down) }      
      it { is_expected.to eq(elevator_4) }
    end

    context "25th floor going down" do
      let(:request) { ElevatorOfAmericas::ElevatorRequest.new(25, :down) }      
      it { is_expected.to eq(elevator_4) }
    end

    context "13th floor going up" do
      let(:request) { ElevatorOfAmericas::ElevatorRequest.new(13, :up) }      
      it { is_expected.to eq(elevator_1) }
    end

    context "17th floor going down" do
      let(:request) { ElevatorOfAmericas::ElevatorRequest.new(17, :down) }      
      it { is_expected.to eq(elevator_4) }
    end
  end
end
