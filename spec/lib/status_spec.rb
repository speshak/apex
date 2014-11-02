require 'spec_helper'

describe Apex::Status, '#read_xml' do
	it "reads xml data into structures" do
		status = Apex::Status.new
		status.read_xml(File.open(File.expand_path('../../../test-data/status.xml', __FILE__)))

		expect(status.date).to eq(Date.strptime('12/29/2013 19:14:58', '%m/%d/%Y %H:%M:%s'))
	end
end
