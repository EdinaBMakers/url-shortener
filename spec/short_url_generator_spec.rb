require 'short_url_generator'

describe 'ShortUrlGenerator' do
  it 'returns with the shortest available url' do
    subject = ShortUrlGenerator.new

    expect(subject.get_short_url).to eq('a')
  end

  it 'returns with the next short url when called multiple times' do
    subject = ShortUrlGenerator.new

    expect(subject.get_short_url).to eq('a')
    expect(subject.get_short_url).to eq('b')
  end

  it 'increases the url length if no more url is available for the current length' do
    valid_chars = ['a', 'b']
    subject = ShortUrlGenerator.new(valid_chars)

    expect(subject.get_short_url).to eq('a')
    expect(subject.get_short_url).to eq('b')
    expect(subject.get_short_url).to eq('aa')
    expect(subject.get_short_url).to eq('ab')
  end
end