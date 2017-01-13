require 'spec_helper'
require 'bigdecimal'

describe NeptuneApex::Status, '#read_xml' do
	it "reads xml data into structures" do
		status = NeptuneApex::Status.new
		status.read_xml(File.open(File.expand_path('../../../test-data/status.xml', __FILE__)))

		expect(status.date).to eq(Date.strptime('12/29/2013 19:14:58', '%m/%d/%Y %H:%M:%s'))

		expect(status.probes['Temp'][:value]).to eq(BigDecimal.new('77.6'))
		expect(status.outlets['VarSpd3_I3'][:state]).to eq('OFF')
	end
end
