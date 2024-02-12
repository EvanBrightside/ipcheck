# frozen_string_literal: true

require 'open-uri'
require_relative 'ipcheck/version'
require_relative 'ipcheck/metadata'

module Ipcheck
  class Error < StandardError; end

  def self.lookup(ip_address)
    return raise Error, 'Invalid IP address format' unless ip_address.match?(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)

    url = "http://ip-api.com/xml/#{ip_address}"
    response = URI.parse(url).read
    Metadata.parse(response)
  end

  def self.my_ip
    url = 'https://api64.ipify.org'
    URI.parse(url).read
  end
end
