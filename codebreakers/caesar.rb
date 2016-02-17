class Caesar
  attr_reader :offset, :message

  def initialize(offset, message)
    @message = message
    @offset = offset.to_i
  end

  def lowercase
    lowers= [*"a".."z"]
    lowers.zip(lowers.rotate(offset)).to_h
  end

  def uppercase
    uppers = [*"A".."Z"]
    uppers.zip(uppers.rotate(offset)).to_h
  end

  def punctuation
    punctuation = [" ", ",", ".", "!", "?"]
    punctuation.zip(punctuation).to_h
  end

  def create_cipher
    @char_map = lowercase.merge(uppercase).merge(punctuation)
  end

  def encrypt
    create_cipher
    prepped_words = message.map { |word| word.chars}
    encrypted = prepped_words.map do |word|
      word.map { |letter| @char_map[letter] }
    end
    sentence = encrypted.map { |word| word.join }
    puts sentence.join(" ")
  end
end

c = Caesar.new(ARGV[0], ARGV[1..-1])
c.encrypt

# ruby caesar.rb 10 Josh Mejia is secretly one half of Daft Punk.
