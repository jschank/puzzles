require 'minitest'
require 'minitest/autorun'
require 'yaml'

class YamlData
  def initialize(data)
    @data = data
  end

  def method_missing(sym, *args, &block)
    key = sym.to_s
    if @data.keys.include?(key)
      value = @data[key]
      case value
      when Hash
        YamlData.new(value)
      when Array
        value.map { |item| YamlData.new(item) }
      else
        value
      end
    else
      super
    end
  end
end


class TestYamlData < MiniTest::Test

  def setup
    @yaml = YAML.load_file('music.yaml')
  end

  def test_yaml_load_is_working
    data = @yaml
    assert_equal("But Not For Me", data["genres"].last["artists"].first["albums"].first["tracks"].last["name"])
  end

  def test_YamlData_interprets_hash_keys_as_method_calls
    data = YamlData.new(@yaml)
    assert_equal("But Not For Me", data.genres.last.artists.first.albums.first.tracks.last.name)
  end

  def test_with_recursive_open_struct
    require 'recursive-open-struct'
    data = RecursiveOpenStruct.new(@yaml, :recurse_over_arrays => true)
    assert_equal("But Not For Me", data.genres.last.artists.first.albums.first.tracks.last.name)
  end
end

