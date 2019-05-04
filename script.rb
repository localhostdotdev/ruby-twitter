require 'nokogiri'

page = Nokogiri::HTML(File.read('all.html'))

names = page.css('.js-user-profile-link').map { |a| a['href'][1..-1] }
names = names.sort.uniq
names = names.map do |name|
  "[@#{name.gsub("_", "\\_")}](https://twitter.com/#{name})"
end

puts names
