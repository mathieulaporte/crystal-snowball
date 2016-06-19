module Crystal::Snowball
  class Stemmer
    def initialize(language : String, encoding : String)
      @language = language
      @encoding = encoding
    end

    def stem(words)
      words.split(" ").map do |word|
        stemmer = Crystal::Snowball::Lib.init(@language, @encoding)
        string = String.new(Crystal::Snowball::Lib.stem(stemmer, word))
        Crystal::Snowball::Lib.del(stemmer)
        string
      end.join(" ")
    end
  end
end
