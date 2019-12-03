# Url Shortener API

## Description

A Sinatra API for shortening the posted url and redirecting to the original url based on the given shortened url.


## Getting Started

1. Clone this repo to your local machine using git@github.com:EdinaBMakers/url-shortener.git
2. Run gem install bundle (if it is not installed already)
3. Run bundle
4. Run `rackup -p <PORT>` 


## Features Implemented

```
User can post url and receive the shortest available shortened url
```

```
User can post the same url multiple times and receive the same shortened url
```

```
User can post the same url with or without `http://` and receive the same shortened url
```

```
User receives unique shortened urls when posting unique original urls
```

```
User gets redirected to the original url when sending a get request with a known shortened url
```

```
User receives 404 (Not Found) when sending a get request with an unknown shortened url 
```


## Testing

Tests can be run from the root directory, using the `rspec` command.

Both the short url generator component and the Sinatra API routes are tested with `Rspec` and `Rack::Test`.


# Url Shortener Code Test

Without using an external database, we'd like you to create a URL shortening
service. The URLs do not need to persist between restarts, but should be
shareable between different clients while the server is running.

- There should be an endpoint that responds to `POST` with a json body
  containing a URL, which responds with a JSON repsonse of the short url and
  the orignal URL, as in the following curl example:

```
curl localhost:4000 -XPOST -d '{ "url": "http://www.farmdrop.com" }'
{ "short_url": "/abc123", "url": "http://www.farmdrop.com" }
```


- When you send a GET request to a previously returned URL, it should redirect
  to the POSTed URL, as shown in the following curl example:

```
curl -v localhost:4000/abc123
...
< HTTP/1.1 301 Moved Permanently
...
< Location: http://www.farmdrop.com
...
{ "url": "http://www.farmdrop.com" }
```

Use whatever languages and frameworks you are comfortable with. Don't worry
about getting the whole thing working flawlessly, this is more to see how you
structure a program. Please don't spend more than a few hours on it.

Bonus points:

- I often forget to type "http://" at the start of a URL. It would be nice if
  this was handled by the application (frontend or backend is up to you).
- We like to see how you approach the problem, so a few git commits with a
  clear message about what you're doing are better than one git commit with
  everything in it.
- We like tests. We don't expect a full test suite, but some tests would be
  nice to see. Its up to you whether thats integration, unit or some other
  level of testing.
- We'd be very happy to see a Dockerfile to run the project. This by no means a
  requirement, so don't go reading the Docker docs if you've never worked with
  it.
- If you'd like to show off your frontend skills, you could create a simple
  frontend that can create and display shortened URLs without reloading the
  page.

## Submission

Please clone this repository, write some code and update this README with a
guide of how to run it.

Either send us a link to the repository on somewhere like github or bitbucket
(bitbucket has free private repositories) or send us a git bundle.

    git bundle create yournamehere-url-shortener-test.bundle master

And send us the resulting `yournamehere-url-shortener-test.bundle` file.

This `.bundle` file can be cloned using:

    git bundle clone bundle-filename.bundle -b master directory-name
