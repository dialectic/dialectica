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
      end

      class << self
        def inherited(subclass)
          subclass.include(Abstract)
        end
      end
    end
  end
end
