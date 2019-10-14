# frozen_string_literal: true

require "dialectica/structure"

require "features/structure/examples/cases"

RSpec.describe "structure" do
  let(:structure) {
    Dialectica::Structure.new(engine: engine, **opts)
  }

  let(:opts) { {} }

  describe "engine: default" do
    let(:engine) {
      :default
    }

    it_behaves_like :cases
  end
end
