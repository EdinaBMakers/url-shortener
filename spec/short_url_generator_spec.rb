require 'short_url_generator'

describe 'ShortUrlGenerator' do
  it 'returns with the shortest available url' do
    subject = ShortUrlGenerator.new

    expect(subject.get_short_url).to eq('a')
  end
end