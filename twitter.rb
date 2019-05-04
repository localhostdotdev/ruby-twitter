require 'dotenv/load'
require 'twitter'

TWEET_ID = '1124328040027369473'
FILENAME = 'users.txt'

File.write(FILENAME, '') unless File.exists?(FILENAME)

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['KEY_1']
  config.consumer_secret = ENV['KEY_2']
  config.access_token = ENV['TOKEN_1']
  config.access_token_secret = ENV['TOKEN_2']
end

tweet = client.status(TWEET_ID)
users = client.retweeters_of(tweet, count: 100).map(&:screen_name)
# sadly can't get favorites and replies :(

users += File.read(FILENAME).split("\n")

File.write(FILENAME, users.sort.uniq.join("\n"))

