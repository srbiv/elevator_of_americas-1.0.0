require 'spec_helper'

RSpec.describe ElevatorOfAmericas::Elevator do
  subject(:elevator) { described_class.new(current_floor) }
  let(:requested_floor) { 13 }
  let(:direction) { :down }
  let(:elevator_request) { ElevatorOfAmericas::ElevatorRequest.new(requested_floor, direction) }
  let(:current_floor) { 12 }

  describe "#convenient?" do
    subject(:convenient?) { elevator.convenient?(elevator_request) }

    context "elevator is idle" do
      context "elevator is above the requested floor" do
        let(:requested_floor) { 5 }

        it { is_expected.to be_truthy }
      end

      context "elevator is below the requested floor" do
        let(:requested_floor) { 25 }

        it { is_expected.to be_truthy }
      end

      context "elevator is on the requested floor" do
        let(:requested_floor) { 12 }

        it { is_expected.to be_truthy }
      end
    end

    context "elevator is moving down" do
      before do
        allow(elevator).to receive(:current_direction) { :down }
      end

      context "elevator is above the requested floor" do
        let(:requested_floor) { 5 }

        it { is_expected.to be_truthy }
      end

      context "elevator is below the requested floor" do
        let(:requested_floor) { 25 }

        it { is_expected.to be_falsy }
      end

      context "elevator is on the requested floor" do
        let(:requested_floor) { 12 }

        it { is_expected.to be_truthy }
      end
    end

    context "elevator is moving up" do
      before do
        allow(elevator).to receive(:current_direction) { :up }
      end

      context "elevator is above the requested floor" do
        let(:requested_floor) { 5 }

        it { is_expected.to be_falsy }
      end

      context "elevator is below the requested floor" do
        let(:requested_floor) { 25 }

        it { is_expected.to be_falsy }
      end

      context "elevator is on the requested floor" do
        let(:requested_floor) { 12 }

        it { is_expected.to be_falsy }
      end
    end
  end
end
