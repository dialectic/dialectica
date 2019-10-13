# frozen_string_literal: true

require "dialectica/structure/engine"
require "dialectica/structure/engines/default"

RSpec.describe Dialectica::Structure::Engine do
  it "includes Abstract into subclasses" do
    expect(
      Dialectica::Structure::Default.ancestors
    ).to include(Dialectica::Structure::Engine::Abstract)
  end
end
