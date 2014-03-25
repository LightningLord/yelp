require 'rubygems'
require 'oauth'
require 'httparty'
require 'awesome_print'
require 'json'


consumer_key = ''
consumer_secret = ''
token = ''
token_secret = ''

api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

path = "/v2/search?term=bars&location=San+Francisco&limit=1"

ap JSON.parse(access_token.get(path).body)