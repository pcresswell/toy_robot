require "spec_helper"

describe Client do
  let(:client) { build :client }
  let(:robot) { client.instance_variable_get "@robot" }
  let(:arena) { client.instance_variable_get "@arena" }

  describe "#parse" do
    context 'when command is "place"' do
      context "when full direction name is given" do
        input = "place 0, 0, north"

        it "sends execute to PlaceCommand.new robot: @robot, command: input" do
          dbl = instance_double "PlaceCommand"
          expect(PlaceCommand).to(receive(:new).with(robot: robot,
                                                     command: input,
                                                     arena: arena) { dbl })
          expect(dbl).to receive :execute
          client.parse input
        end
      end

      context "when first character of direction initial is given" do
        input = "place 0, 0, n"

        it "sends execute to PlaceCommand.new robot: @robot, command: input" do
          dbl = instance_double "PlaceCommand"
          expect(PlaceCommand).to(receive(:new).with(robot: robot,
                                                     command: input,
                                                     arena: arena) { dbl })
          expect(dbl).to receive :execute
          client.parse input
        end
      end

      context "when part of direction name is given" do
        input = "place 0, 0, nor"

        it "sends execute to InvalidCommand.new" do
          dbl = instance_double "InvalidCommand"
          expect(InvalidCommand).to receive(:new) { dbl }
          expect(dbl).to receive :execute
          client.parse input
        end
      end
    end

    context 'when command is "move"' do
      input = "move"

      it "sends execute to MoveCommand.new robot: @robot" do
        dbl = instance_double "MoveCommand"
        expect(MoveCommand).to receive(:new).with(robot: robot) { dbl }
        expect(dbl).to receive :execute
        client.parse input
      end
    end

    context 'when command is "left"' do
      input = "left"

      it "sends execute to LeftCommand.new robot: @robot" do
        dbl = instance_double "LeftCommand"
        expect(LeftCommand).to receive(:new).with(robot: robot) { dbl }
        expect(dbl).to receive :execute
        client.parse input
      end
    end

    context 'when command is "right"' do
      input = "right"

      it "sends execute to RightCommand.new robot: @robot" do
        dbl = instance_double "RightCommand"
        expect(RightCommand).to receive(:new).with(robot: robot) { dbl }
        expect(dbl).to receive :execute
        client.parse input
      end
    end

    context 'when command is "report"' do
      input = "report"

      it "sends execute to ReportCommand.new robot: @robot" do
        dbl = instance_double "ReportCommand"
        expect(ReportCommand).to receive(:new).with(robot: robot) { dbl }
        expect(dbl).to receive :execute
        client.parse input
      end
    end

    context "when command is invalid" do
      input = "derp"

      it "sends execute to InvalidCommand.new" do
        dbl = instance_double "InvalidCommand"
        expect(InvalidCommand).to receive(:new) { dbl }
        expect(dbl).to receive :execute
        client.parse input
      end
    end
  end
end
