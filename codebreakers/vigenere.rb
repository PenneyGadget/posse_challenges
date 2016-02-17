require 'pry'

class Vigenere
  attr_reader :key, :message, :rotation_key, :char_map, :letters

  def initialize(key, message)
    @key = key
    @message = message
    @rotation_key = rotation_key
    @char_map = char_map
    @letters = [*"a".."z"]
  end

  def create_rotation_key(key)
    @char_map = *("a".."z")
    numbers = *(1..26)
    @char_map = @char_map.zip(numbers).to_h
    @rotation_key = key.downcase.chars.map { |letter| @char_map[letter] }
  end

  # def punctuation
  #   punctuation = [" ", ",", ".", "!", "?"]
  #   punctuation = punctuation.zip(punctuation).to_h
  #   @char_map = punctuation.merge(@letters)
  # end

  def parsed_message_against_key
    @message = @message.join(" ").downcase.chars
    @message = @message.each_slice(rotation_key.length).to_a
    # x = @message.map { |chunk| chunk.zip(rotation_key).to_h }
  end

  # @letters.rotate(@letters.index("m")).rotate(20)[0]

  # def capital?(letter)
  #   letter.upcase == letter
  # end

  def encrypt
    create_rotation_key(key)
    parsed_message_against_key

    @message.each do |array|
      array.map do |l|
        x = @letters.rotate(@letters.index(l))
        x.rotate(20)[0] #the number 20 needs to change dynamically (rotation_key)
      end
    end
    # prepped_words = string.flatten.map { |word| word.downcase.chars }
    # create_rotation_key(string_key)
    # encrypted = prepped_words.map do |word|
    #   word.map { |letter| @char_map[letter] }
    # end
    # encrypted.map { |word| puts word.join }
  end
end

v = Vigenere.new(ARGV[0], ARGV[1..-1])
v.encrypt

# $ ruby vigenere.rb taylor Make PHP great again.
# Faip DYI gppok tgytb.
# Gbjq E..

# class Vigenere
#   attr_reader :key, :message
# 
#   def initialize(key, message)
#     @key = key.chars.map { |l| letter_map[l.downcase] }
#     @message = message
#   end
#
#   def encrypt_message
#     i = -1
#
#     message.chars.map do |l|
#       if letter_is_part_of_alphabet(l)
#         i = i + 1
#         capital?(l) ? encrypt(l, i).upcase : encrypt(l, i)
#       else
#         l
#       end
#     end.join
#   end
#
#   private
#
#   def letter_map
#     [*"a".."z"].zip([*1..26]).to_h
#   end
#
#   def encrypt(letter, i)
#     num = convert_letter_to_number(letter.downcase)
#
#     new_index = (num + get_key_number(i)) % 26
#     new_index = 26 if new_index == 0
#
#     letter_map.key(new_index)
#   end
#
#   def convert_letter_to_number(letter)
#     letter_map[letter]
#   end
#
#   def capital?(letter)
#     letter == letter.upcase
#   end
#
#   def letter_is_part_of_alphabet(letter)
#     letter_map.include?(letter.downcase)
#   end
#
#   def get_key_number(i)
#     key[i % key.length]
#   end
# end
#
# if __FILE__ == $0
#   vigenere = Vigenere.new(ARGV[0], ARGV[1..-1].join(" "))
#   puts vigenere.encrypt_message
# end
