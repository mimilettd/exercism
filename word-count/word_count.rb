=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end

class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    words.inject({}) do |count, word|
      word = Word.modify(word)
      count[word] ? count[word] += 1 : count[word] = 1
      count
    end
  end

  def words
    string.downcase.gsub(/[^a-zA-Z0-9' ]/, " ").strip.split
  end

  private
  attr_reader :string

  class Word
    def self.modify(word)
      new(word).modify
    end

    def initialize(word)
      @word = word
    end

    def modify
      word.gsub(/^'|'$|%&/, '')
    end

    private

    attr_reader :word
  end
end
