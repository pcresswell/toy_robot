require "spec_helper"

describe Position do
  let(:position) { build :position }

  describe "#advance" do
    it "changes new instance's x_coord by direction's X_DISPLACEMENT" do
      stub_const "#{position.direction}::X_DISPLACEMENT", 1
      expect { position.advance }.to change { position.x_coord }.by(1)
    end

    it "changes new instance's y_coord by direction's Y_DISPLACEMENT" do
      stub_const "#{position.direction}::Y_DISPLACEMENT", 1
      expect { position.advance }.to change { position.y_coord }.by(1)
    end
  end

  describe "#left" do
    it "sends left to @direction" do
      expect(position.direction).to receive(:left)
      position.left
    end
  end

  describe "#right" do
    it "sends right to @direction" do
      expect(position.direction).to receive(:right)
      position.right
    end
  end

  describe "#to_s" do
    it "returns string of format 'x, y, d'" do
      expect(position.to_s).to(
          match(/(\d+,\s){2}((North)|(East)|(South)|(West))$/),
      )
    end
  end
end
