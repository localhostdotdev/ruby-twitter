FILENAME = "users.txt"

puts "# ruby-twitter"
puts
File.read(FILENAME).split("\n").each do |name|
  puts "- [@#{name.gsub("_", "\\_")}](https://twitter.com/#{name})"
end
