require "open-uri"
require "nokogiri"

module Apex
	class Controller 
		attr_accessor :url

		def initialize(url)
			@url = url
		end

		def status
			Status.from_xml(open("#{@url}/cgi-bin/status.xml"))
		end
	end
end
