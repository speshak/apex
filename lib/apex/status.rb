require 'bigdecimal'
require "nokogiri"

module Apex
	class Status
		attr_accessor :date, :power, :probes, :outlets

		def self.from_xml(data)
			status = Status.new
			status.read_xml(data)
			return status
		end


		def initialize
			@probes = {}
			@outlets = {}
		end


		def read_xml(xml)
			doc = Nokogiri::XML(xml)

			@date = Date.strptime(doc.at_xpath('//status/date').text, '%m/%d/%Y %H:%M:%s')

			doc.at_xpath('//status/probes').xpath('./probe').each{|probe|
				add_probe(
					probe.at_xpath('./name').text,
					BigDecimal.new(probe.at_xpath('./value').text),
					probe.at_xpath('./type').text
				)
			}
		end


		def add_probe(name, value, type)
			@probes[name] = { :value => value, :type => type }
		end


		def add_outlet(name, id, state, device_id)
			@outlets[name] = {
				:id			=> id,
				:state		=> state,
				:device_id	=> device_id,
			}
		end
		
	end
end
