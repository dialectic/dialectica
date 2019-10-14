# frozen_string_literal: true

module Dialectica
  class Structure
    # Base structure engine, containing the high level logic for building structures. Subclasses are
    # expected to provide an implementation for the inteface described by `Engine::Abstract`.
    #
    class Engine
      def initialize(**)
      end

      # Implement these methods in engine subclasses.
      #
      module Abstract
        def atoms(category: nil)
          not_implemented!
        end

        def categories
          not_implemented!
        end

        def find_node(categories:)
          not_implemented!
        end

        def create_node(categories: [])
          not_implemented!
        end

        def insert(atom)
          not_implemented!
        end

        private

        def not_implemented!
          raise RuntimeError, "not implemented"
        end
      end

      class << self
        def inherited(subclass)
          subclass.include(Abstract)
        end
      end
    end
  end
end
