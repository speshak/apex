module Apex
  module Profile
    class Hydra < Base

      # Colors
      attr_accessor :cool_white, :warm_white, :neutral_white, :green, :violet, :red, :deep_blue, :royal_blue, :uv


      def initialize
        @type = 'Hydra'
      end

    end
  end
end
