class ShortUrlGenerator
  def initialize
    @valid_chars = ['a'..'z', 'A'..'Z', '0'..'9'].flat_map(&:to_a) 
  end

  def get_short_url
    @valid_chars.shift
  end
end