require 'neptune_apex'
require 'thor'
require 'terminal-table'

require_relative 'profile'

module NeptuneApex
  module Cli
    class Main < Thor
      desc "status", "Get current status of controller outlets & probes"
      def status
        cont = create_controller
        status = cont.status

        puts "Apex status as of #{status.date.strftime('%F %R')}"

        puts Terminal::Table.new :headings => ['Probe', 'Value'] {|t|
          status.probes.each{|name, probe|
            t << [name, probe[:value].to_s('F')]
          }
        }

        puts "\n"

        puts Terminal::Table.new :headings => ['Outlet', 'State'] {|t|
          status.outlets.each{|name, outlet|
            t << [name, outlet[:state]]
          }
        }

      end



      desc "datalog", "Get datalog values"
      def datalog
        puts "Not yet implemented"
      end

      desc "profile SUBCOMMAND", "manage profiles"
      subcommand "profile", ProfileCli


      private
        ##
        # Look for a config file & load
        def create_controller
          conf_file = File.expand_path('~/.apexcli')

          if ENV['APEXCONF']
            conf_file = ENV['APEXCONF']
          end

          if File.exist?(conf_file)
            controller = NeptuneApex::Controller.new()
            conf = YAML.load_file(conf_file)
            controller.url = conf['url']
            controller.user = conf['user']
            controller.password = conf['password']
            return controller
          else
            raise Exception.new('Config file not found!')
          end
        end

    end
  end
end
