# frozen_string_literal: true

module Dialectica
  # Build and interact with a structured set of categories and atoms.
  #
  class Structure
    attr_reader :engine

    # Pass `engine` to use an engine other than `:default`.
    # Any options are passed through to the engine's `initialize` method.
    #
    def initialize(engine: :default, **opts)
      setup_engine!(engine, **opts)
    end

    private

    def setup_engine!(engine, **opts)
      require "dialectica/structure/engines/#{engine}"
      @engine = engine_const(engine).new(**opts)
    end

    def engine_const(engine)
      self.class.const_get(classify(engine))
    end

    def classify(engine)
      engine.to_s.split("_").map(&:capitalize).join
    end
  end
end
