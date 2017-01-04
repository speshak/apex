module Apex
  module Profile
    # An AI Vega/Hydra LED light profile
    class Vega < Base
      # Colors
      attr_accessor :cWhite, :wWhite, :nWhite, :green, :violet, :red, :dBlue, :rBlue, :UV, :blue

      # Parameters
      attr_accessor :min, :max, :rampTime


      def initialize
        @type = 'vega'
      end

    end
  end
end
