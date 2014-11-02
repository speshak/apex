require 'spec_helper'
require 'bigdecimal'

describe Apex::Status, '#read_xml' do
	it "reads xml data into structures" do
		status = Apex::Status.new
		status.read_xml(File.open(File.expand_path('../../../test-data/status.xml', __FILE__)))

		expect(status.date).to eq(Date.strptime('12/29/2013 19:14:58', '%m/%d/%Y %H:%M:%s'))

		expect(status.probes['Temp'][:value]).to eq(BigDecimal.new('77.6'))
	end
end
