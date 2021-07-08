# frozen_string_literal: true

require "set"

require "dialectica/structure/engine"
require "dialectica/structure/node"

module Dialectica
  class Structure
    # Default engine for computing the graph. Performs all computation on the client.
    #
    # TODO: I'd like to support an adapter interface here for storing in memory / redis.
    # All the computation would still be done here, but the values would exist elsewhere.
    #
    class Default < Engine
      def initialize(**)
        @atoms, @categories, @nodes = Set.new, {}, []
      end

      def insert(atom)
        @atoms << atom
      end

      def find_node(categories:)
        @nodes.find { |node|
          node.categories == categories
        }
      end

      def create_node(categories: [])
        node = Node.new(categories: categories)
        @nodes << node
        node
      end
    end
  end
end
