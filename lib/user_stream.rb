# -*- coding: utf-8 -*-

require "user_stream/version"
require "user_stream/config"
require "user_stream/api"
require "user_stream/client"

module UserStream
  extend Configuration

  def self.client(options = {})
    UserStream::Client.new(options)
  end

  def self.method_missing(method_name, *args, &block)
    return super unless client.respond_to?(method_name)
    client.send(method_name, *args, &block)
  end

  def self.respond_to?(method_name)
    return client.respond_to?(method_name) || super
  end
end