# frozen_string_literal: true

module Dialectica
  # Build and interact with a structured set of categories and atoms.
  #
  class Structure
    require "dialectica/structure/selection"

    attr_reader :engine

    # Pass `engine` to use an engine other than `:default`.
    # Any options are passed through to the engine's `initialize` method.
    #
    def initialize(engine: :default, **opts)
      setup_engine!(engine, **opts)
    end

    def atoms(visible: true)
      if visible
        @engine.find_node(categories: [])&.atoms.to_a
      else
        @engine.atoms
      end
    end

    def categories
      @engine.find_node(categories: [])&.categories.to_a
    end

    def insert(atom, *categories)
      categories = normalize_categories(categories)

      # Make the engine aware of the atom's existance.
      #
      @engine.insert(atom)

      # Create the node for all categories.
      #
      node = find_or_create_node(categories: categories)

      # Create each combination node.
      #
      node.combinations.each do |combination|
        find_or_create_node(categories: combination)
      end

      # Insert the atom into its node.
      #
      node.insert(atom)
    end

    def select(*categories)
      categories = normalize_categories(categories)

      Selection.new(
        structure: self,
        categories: categories,
        node: find_or_create_node(categories: categories)
      )
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

    def find_or_create_node(categories: [])
      @engine.find_node(categories: categories) || @engine.create_node(categories: categories)
    end

    def normalize_categories(categories)
      categories = categories.map(&:to_sym)
      categories.sort!
      categories
    end
  end
end
