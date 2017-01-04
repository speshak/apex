require 'thor'

module NeptuneApex
  module Cli
    class ProfileCli < Thor
      desc "export <name>", "Exports profile named <name>"
      def export(name)
        puts "Not yet implemented"
      end


      desc "import <name>", "Imports a profile named <name>.  Overwrites existing profile of the same name."
      def import(name)
        puts "Not yet implemented"
      end
    end
  end
end

