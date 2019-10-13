# frozen_string_literal: true

require "dialectica/structure"

RSpec.describe Dialectica::Structure do
  describe "initialize" do
    it "initializes with a default engine" do
      expect(
        described_class.new.engine
      ).to be_instance_of(Dialectica::Structure::Default)
    end

    describe "specifying an engine" do
      it "initializes with the specified engine" do
        expect(
          described_class.new(engine: :custom).engine
        ).to be_instance_of(Dialectica::Structure::Custom)
      end
    end
  end
end
