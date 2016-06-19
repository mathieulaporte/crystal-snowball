# crystal-snowball

Snowball is a small string processing language designed for creating stemming algorithms for use in Information Retrieval.
This is a crystal binding for the C API provided by [snowball](http://snowballstem.org/).

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  crystal-snowball:
    github: mathieulaporte/crystal-snowball
```


## Usage


```crystal
require "crystal-snowball"

puts Crystal::Snowball::Stemmer.new("en", "UTF_8").stem("installation")
# instal
```


## Contributing

1. Fork it ( https://github.com/[your-github-name]/crystal-snowball/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [mathieulaporte](https://github.com/mathieulaporte) Mathieu Laporte - creator, maintainer
