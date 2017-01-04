require 'open-uri'
require 'yaml'
require 'httpclient'

module NeptuneApex
  class Controller
    # Controller URL
    attr_accessor :url

    # Controller username
    attr_accessor :user

    # Controller password
    attr_accessor :password


    def initialize(url=nil)
      load_conf

      if url
        @url = url
      end
    end

    ##
    # Look for a config file & load
    def load_conf
      conf_file = File.expand_path('~/.apexcli')

      if ENV['APEXCONF']
        conf_file = ENV['APEXCONF']
      end

      if File.exist?(conf_file)
        conf = YAML.load_file(conf_file)
        @url = conf['url']
        @user = conf['user']
        @password = conf['password']
      else
        raise Exception.new('Config file not found!')
      end
    end


    ##
    # Get the current status of the controller
    def status
      Status.from_xml(open("#{@url}/cgi-bin/status.xml"))
    end


    ##
    # Get the datalog from the controller
    def datalog
      Datalog.from_xml(open("#{@url}/cgi-bin/datalog.xml"))
    end


    # Get a prepared UserAgent
    def user_agent
      unless @user_agent
        @user_agent = HTTPClient.new
        @user_agent.set_auth(@url, @user, @password)
      end

      @user_agent
    end

  end
end
