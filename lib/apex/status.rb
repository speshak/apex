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

			doc.xpath('//status/probes/probe').each{|probe|
				add_probe(
					probe.at_xpath('./name').text,
					probe.at_xpath('./value').text,
					probe.at_xpath('./type').text
				)
			}


			doc.xpath('//status/outlets/outlet').each{|outlet|
				add_outlet(
					outlet.at_xpath('./name').text,
					outlet.at_xpath('./outputID').text,
					outlet.at_xpath('./state').text,
					outlet.at_xpath('./deviceID').text
				)
			}
		end


		def add_probe(name, value, type)
			@probes[name] = { :value => BigDecimal.new(value), :type => type }
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
