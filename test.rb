# require 'digest/sha1'
# Digest::SHA1.hexdigest("some string")

s1 = 'abcde'
s2 = 'ecdab'
# s2 = 'abcde'

# puts Digest::SHA1.hexdigest(s1)
# puts Digest::SHA1.hexdigest(s2)
# puts s1.hash
# puts s2.hash
# return

sum = 0
s1.chars.each do |ch|
  puts "#{ch} : #{ch.ord}"
  sum += ch.ord
end
puts sum

puts '----------------------------'

sum = 0
s2.chars.each do |ch|
  puts "#{ch} : #{ch.ord}"
  sum += ch.ord
end
puts sum