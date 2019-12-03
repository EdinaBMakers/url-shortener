class ShortUrlGenerator
  DEFAULT_VALID_CHARS = ['a'..'z', 'A'..'Z', '0'..'9'].flat_map(&:to_a)

  def initialize(valid_chars = DEFAULT_VALID_CHARS)
    @valid_chars = valid_chars
    @current_short_url_length = 1
    @available_short_urls = generate_short_urls
  end

  def generate_short_urls
    short_urls = @valid_chars.dup

    return short_urls if @current_short_url_length == 1

    (@current_short_url_length - 1).times do
      short_urls = short_urls.product(@valid_chars)
    end

    short_urls.map {|chars| chars.flatten.join}
  end

  def get_short_url
    if @available_short_urls.empty?
      @current_short_url_length += 1
      @available_short_urls = generate_short_urls
    end

    @available_short_urls.shift
  end
end