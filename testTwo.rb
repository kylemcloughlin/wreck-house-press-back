
Dir["./test.rb"].each { |file| require file }
puts"hit"

articles.each do |e|
  puts "#{e[:body]}"
end
