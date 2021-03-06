# frozen_string_literal: true

module RuboCop
  module Cop
    module Layout
      # Checks for comma (,) not followed by some kind of space.
      #
      # @example
      #
      #   # bad
      #   [1,2]
      #   { foo:bar,}
      #
      #   # good
      #   [1, 2]
      #   { foo:bar, }
      #
      # @api private
      class SpaceAfterComma < Base
        include SpaceAfterPunctuation
        extend AutoCorrector

        def space_style_before_rcurly
          cfg = config.for_cop('Layout/SpaceInsideHashLiteralBraces')
          cfg['EnforcedStyle'] || 'space'
        end

        def kind(token)
          'comma' if token.comma?
        end
      end
    end
  end
end
