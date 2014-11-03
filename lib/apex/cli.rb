require 'apex'
require 'thor'
require 'terminal-table'

module Apex
	class Cli < Thor
		desc "status", "Get current status of controller outlets & probes"
		option :url, :required => true
		def status
			cont = Apex::Controller.new(options[:url])
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

	end
end
