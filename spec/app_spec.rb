describe 'UrlShortener' do

  def app
    UrlShortener
  end

  it 'can handle post requests' do
    body = '{ "url": "http://www.farmdrop.com" }'
    post('/', body)

    expect(last_response).to be_ok
  end

  it 'responds with the short and original url' do
    body = '{ "url": "http://www.farmdrop.com" }'
    post('/', body)

    expect(last_response.body).to eq('{"short_url":"/a","url":"http://www.farmdrop.com"}')
  end

  it 'responds with the same short url for the same original url' do
    body = '{ "url": "http://www.farmdrop.com" }'
    post('/', body)

    expect(last_response.body).to eq('{"short_url":"/a","url":"http://www.farmdrop.com"}')

    post('/', body)

    expect(last_response.body).to eq('{"short_url":"/a","url":"http://www.farmdrop.com"}')
  end

  it 'responds with the same short url for url with or witout http' do
    body = '{ "url": "http://www.farmdrop.com" }'
    post('/', body)

    expect(last_response.body).to eq('{"short_url":"/a","url":"http://www.farmdrop.com"}')

    body = '{ "url": "www.farmdrop.com" }'
    post('/', body)

    expect(last_response.body).to eq('{"short_url":"/a","url":"www.farmdrop.com"}')
  end

  it 'responds with different short url for different original urls' do
    body = '{ "url": "http://www.farmdrop.com" }'
    post('/', body)

    expect(last_response.body).to eq('{"short_url":"/a","url":"http://www.farmdrop.com"}')

    body = '{ "url": "microsoft.com" }'
    post('/', body)

    expect(last_response.body).to eq('{"short_url":"/b","url":"microsoft.com"}')
  end

  it 'responds with 404 if short url is unknown' do
    get('/unknown')

    expect(last_response.status).to be(404)
  end

  it 'redirects to original url if short url is known' do
    body = '{ "url": "http://www.farmdrop.com" }'
    
    post('/', body)
    get('/a')

    expect(last_response.status).to be(302)
    expect(last_response.header['Location']).to eq('http://www.farmdrop.com')
  end
end