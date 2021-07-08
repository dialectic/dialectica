# frozen_string_literal: true

module Dialectica
  class Structure
    # A selection within the graph.
    #
    class Selection
      def initialize(structure:, categories:, node:)
        @structure, @categories, @node = structure, categories, node
      end

      def atoms
        @node.atoms
      end

      def subcategories
        @node.subcategories
      end

      def select(*categories)
        Selection.new(structure: @structure, categories: @categories + categories)
      end

      def reject(*categories)
        Selection.new(structure: @structure, categories: @categories - categories)
      end

      def insert(atom, *categories)
        @structure.insert(atom, @categories + categories)
      end
    end
  end
end
