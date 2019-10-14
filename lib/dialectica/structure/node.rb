# frozen_string_literal: true

module Dialectica
  class Structure
    # A node within the graph containing atoms, categories, and subcategories.
    #
    class Node
      attr_reader :atoms, :categories

      def initialize(categories: [])
        @atoms, @categories = Set.new, categories
      end

      def insert(atom)
        @atoms << atom
      end

      # TODO: Implement this. Thinking we'll compute these when necessary, memoizing the value. Then
      # when the graph changes we can taint each affected node and rebuild when we need to.
      #
      def subcategories
        []
      end

      def combinations
        @combinations ||= compute_combinations
      end

      private

      def compute_combinations
        (1..@categories.length).flat_map { |depth|
          @categories.combination(depth).to_a
        }
      end
    end
  end
end
