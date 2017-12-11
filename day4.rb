# ss = File.read('day4_input.txt')
ss = File.read('day4_input_test.txt')
# lines = File.readlines('day4_input_test.txt')
# ss = File.read('day4_input_test.txt')
lines = ss.split("\n")
puts ss.inspect
puts lines.inspect
# return

# puts lines.count
correctLines = 0

count = 1
lines.each do |line|
  hashOfWords = {}
  addAsUnique = true
  line.split(' ').each do |word|
    word = word.chars.sort.join()
    puts word.length
    # puts word
    wordHash = 0

    word.chars.each do |ch|
      # puts "#{ch} = #{ch.ord}"
      wordHash += (wordHash) + ch.ord
      # puts "wordHash: #{wordHash}"
    end

    if hashOfWords.has_key?(word)
      puts "dup -- #{word} - #{wordHash}"
      puts "hashOfWords -- #{hashOfWords}"
      puts '------------------'
      addAsUnique = false
    end
    hashOfWords[word] = word
  end

  if addAsUnique
    correctLines += 1
  end

  puts "#{count}: addAsUnique: #{addAsUnique} hashOfWords : #{hashOfWords}"
  count += 1
end

puts "lines.count : #{lines.count}"
puts "correctLines : #{correctLines}"

# puts "#{ch} = #{ch.ord}"
#