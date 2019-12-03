describe 'UrlShortener' do
  def app
    UrlShortener
  end

  it 'can handle post requests' do
    body = '{ "url": "http://www.farmdrop.com" }'
    post("/", body)

    expect(last_response).to be_ok
  end
end