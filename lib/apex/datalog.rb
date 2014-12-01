require "nokogiri"

module Apex
	class Datalog
		attr_accessor :records

		def initialize
			@records = {}
		end


		def read_xml(xml)
			doc = Nokogiri::XML(xml)

			doc.xpath('//datalog/record').each{|record|
				stat = Status.new
				
				record.xpath('./probe').each{|probe|
					stat.add_probe(
						probe.at_xpath('./name').text,
						probe.at_xpath('./value').text,
						probe.at_xpath('./type').text
					)
				}

				@records[record.at_xpath('./date').text] = stat
			}
		end
	end
end
