# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable

  def initialize(url)
    @uri = URI(url)
    @params = {}
    return if uri.query.nil?

    uri.query.split('&') do |param|
      key, value = param.split('=')
      params[key.to_sym] = value
    end
  end

  def query_params
    params
  end

  def query_param(name, default = nil)
    params.fetch(name, default)
  end

  def <=>(other)
    uri <=> other.uri
  end

  def_delegators :uri, :scheme, :host

  protected

  attr_reader :uri

  private

  attr_reader :params
end
# END
