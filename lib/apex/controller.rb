require 'open-uri'
require 'mechanize'

module Apex
  class Controller 
    attr_accessor :url

    # Controller username
    attr_accessor :user

    # Controller password
    attr_accessor :password


    def initialize(url)
      @url = url
    end

    def status
      Status.from_xml(open("#{@url}/cgi-bin/status.xml"))
    end


    def datalog
      Datalog.from_xml(open("#{@url}/cgi-bin/datalog.xml"))
    end


    # Get a prepared UserAgent
    def user_agent
      unless @user_agent
        @user_agent = WWW::Mechanize.new
        @user_agent.basic_auth(@user, @password)
      end

      @user_agent
    end

  end
end
