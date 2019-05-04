require 'dotenv/load'
require 'twitter'

TWEET_ID = '1124328040027369473'
FILENAME = 'users.txt'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['KEY_1']
  config.consumer_secret = ENV['KEY_2']
  config.access_token = ENV['TOKEN_1']
  config.access_token_secret = ENV['TOKEN_2']
end

users = File.read(FILENAME).split("\n")
tweet = client.status(TWEET_ID)

puts "client, users, tweet"
puts "client.add_list_members('ruby', users)"

binding.irb
