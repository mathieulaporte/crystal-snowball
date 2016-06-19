require "./crystal-snowball/*"

module Crystal::Snowball

  @[Link(ldflags: "#{__DIR__}/ext/libstemmer_c/libstemmer.o")]
  lib Lib
    type Stemmer = Void*
    fun init   = sb_stemmer_new(language : UInt8*, enc: UInt8*) : Stemmer
    fun stem   = sb_stemmer_stem(stemmer : Stemmer, word: UInt8*) : UInt8*
    fun length = sb_stemmer_length(stemmer : Stemmer) : Int32
    fun del    = sb_stemmer_delete(stemmer : Stemmer) : Void
  end

  class Stemmer
    def initialize(language : String, encoding : String)
      @language = language
      @encoding = encoding
    end

    def stem(words)
      words.split(" ").map do |word|
        stemmer = Crystal::Snowball::Lib.init(@language, @encoding)
        String.new(Crystal::Snowball::Lib.stem(stemmer, word))
        Crystal::Snowball::Lib.del(stemmer)
      end.join(" ")
    end
  end
end
