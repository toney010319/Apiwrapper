require 'httparty'
require 'json'

class AgeApi
  include HTTParty
  base_uri 'https://api.agify.io'

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def fetch_age
    response = self.class.get("/", query: { name: name })
    parse_response(response)
  rescue HTTParty::Error => e
    { error: "HTTParty error: #{e.message}" }
  rescue StandardError => e
    { error: "Standard error: #{e.message}" }
  end

  private

  def parse_response(response)
    if response.success?
      JSON.parse(response.body)
    else
      { error: "API request failed with status code #{response.code}" }
    end
  end
end