module Apex
	class Status
		attr_accessor :date, :power, :probes, :outlets

		def self.from_xml(data)
			status = Status.new
			status.read_xml(data)
			return status
		end


		def initalize
			@probes = {}
			@outlets = {}
		end


		def read_xml(xml)
			doc = Nokogiri::XML(xml)

			@date = Date.strptime(doc.at_xpath('//status/date').text, '%m/%d/%Y %H:%M:%s')
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
