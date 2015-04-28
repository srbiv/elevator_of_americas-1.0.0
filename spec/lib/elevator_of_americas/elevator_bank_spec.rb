require "spec_helper"

RSpec.describe ElevatorOfAmericas::ElevatorBank do
  subject(:elevator_bank) { 
    described_class.new(elevator_dispatcher: elevator_dispatcher,
                        elevator_factory: elevator_factory,
                        elevator_request_factory: elevator_request_factory,
                        size: size) 
  }
  let(:elevator) { double("Elevator") }
  let(:elevator_dispatcher) { double("ElevatorDispatcher") }
  let(:elevator_factory) { double("ElevatorFactory") }
  let(:elevator_request) { double("ElevatorRequest") }
  let(:elevator_request_factory) { double("ElevatorRequestFactory") }
  let(:size) { 4 }

  before do
    allow(elevator_factory).to receive(:new) { elevator }
  end

  describe "#elevator_count" do
    subject(:elevator_count) { elevator_bank.elevator_count }

    before do
      allow(elevator).to receive(:queue_stop).with(elevator_request)
    end

    context "size is greater than MIN_ELEVATORS" do
      it "equals the size the bank was initialized to" do
        expect(elevator_count).to eq(4)
      end
    end

    context "size is less than MIN_ELEVATORS" do
      let(:size) { 2 }

      it "equals the size the bank was initialized to" do
        expect(elevator_count).to eq(3)
      end
    end
  end

  describe "#dispatch_to" do
    subject(:dispatch_to) { elevator_bank.dispatch_to(floor, direction) }

    let(:floor) { 13 }
    let(:direction) { :down }

    it "dispatches the next elevator" do
      allow(elevator_request_factory).to receive(:new) { elevator_request }
      allow(elevator_dispatcher).to receive(:next_elevator) { elevator }
      expect(elevator).to receive(:queue_stop).with(elevator_request)
      dispatch_to
    end
  end
end
