require 'spec_helper'

describe NeptuneApex::Datalog, "#read_xml" do
	it "reads xml data into structures" do
		datalog = NeptuneApex::Datalog.new
		datalog.read_xml(File.open(File.expand_path('../../../test-data/datalog.xml', __FILE__)))

		expect(datalog.records['11/02/2014 00:10:00'].probes['Temp'][:value]).to eq(BigDecimal.new('75.5'))
	end
end

