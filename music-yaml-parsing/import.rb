require 'minitest'
require 'minitest/autorun'
require 'yaml'

# data = YAML.load(File.open('music.yaml'))

# puts data

class ImportData
  def initialize(hash)
    @hash = hash
  end
  
  def method_missing(meth, *args, &block)
    m = meth.to_s
    if @hash.keys.include?(m)
      value = @hash[m]
      case value
      when Hash
        ImportData.new(value)
      when Array
        value.map { |item| ImportData.new(item) }
      else
        value
      end
    else
      super # You *must* call super if you don't handle the
            # method, otherwise you'll mess up Ruby's method
            # lookup.
    end
  end
end


class TestImport < MiniTest::Test
  def test_imports_into_hash_1
    data = YAML.load(File.open('music.yaml'))
    assert_equal("But Not For Me", data["genres"].last["artists"].first["albums"].first["tracks"].last["name"])
  end

  def test_imports_into_hash_2
    data = ImportData.new(YAML.load(File.open('music.yaml')))
    assert_equal("But Not For Me", data.genres.last.artists.first.albums.first.tracks.last.name)
  end

  def test_imports_into_hash_3
    data = ImportData.new(YAML.load(File.open('music.yaml')))
    raise data.genres.last.artists.inspect
  end

end

