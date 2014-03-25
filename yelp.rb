require 'rubygems'
require 'oauth'
require 'httparty'
require 'awesome_print'
require 'json'



# api_host = 'api.yelp.com'

# consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
# access_token = OAuth::AccessToken.new(consumer, token, token_secret)

# path = "/v2/search?term=bars&location=San+Francisco&limit=1"

# ap JSON.parse(access_token.get(path).body)

class Yelp
  def initialize
    consumer_key = ''
    consumer_secret = ''
    token =''
    token_secret = ''
    api_host = 'api.yelp.com'
    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    @access_token = OAuth::AccessToken.new(consumer, token, token_secret)
  end

  def search(options={})
    term = options[:term]
    location = options[:location].split.join("+")
    limit = options[:limit] || 5
    path = "/v2/search?term=#{term}&location=#{location}&limit=#{limit}"
    JSON.parse(@access_token.get(path).body)["businesses"].map{|business| business["name"]}
  end


end

yelp = Yelp.new
ap yelp.search({term: "bars", location: "San Francisco", limit: 10})
ap yelp.search({term: "restaurants", location: "Mountain View", limit: 10})