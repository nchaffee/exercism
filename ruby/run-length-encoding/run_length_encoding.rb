require 'ostruct'

class MappedData < Array
  def initialize
    @number_stack = []
  end

  def last_char?(char)
    last.char == char if last
  end

  def encode_char(char)
    last_char?(char) ? last.count += 1 : add_group(char)
  end

  def decode_char(char)
    if (0..9).to_a.map(&:to_s).include? char
      @number_stack << char
    else
      add_group(char, [@number_stack.join('').to_i, 1].max)
      @number_stack.clear
    end
  end

  def add_group(char, count = 1)
    push(CharacterGroup.new(char: char, count: count)) unless char.empty?
  end

  def encoded
    if empty?
      ''
    else
      map do |group|
        "#{group.count if group.count > 1}#{group.char}"
      end.join('')
    end
  end

  def decoded
    if empty?
      ''
    else
      map { |group| group.char * group.count }.join('')
    end
  end
end

class CharacterGroup < OpenStruct
end

class RunLengthEncoding
  def self.encode(original_data)
    mapped_data = MappedData.new
    original_data.chars.each { |char| mapped_data.encode_char(char) }
    mapped_data.encoded
  end

  def self.decode(encoded_data)
    mapped_data = MappedData.new
    encoded_data.chars.each { |char| mapped_data.decode_char(char) }
    mapped_data.decoded
  end
end

module BookKeeping
  VERSION = 3
end
