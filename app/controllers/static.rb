get '/' do
  # let user create new short URL, display a list of shortened URLs
  # @urls = Url.all.reverse

  #adding will_paginate
  @urls = Url.paginate(:page => params[:page], :per_page => 20)

  erb :"static/index"
end

post '/urls' do
  # create a new Url
  print params
  url = Url.new(long_url:params[:long_url])
  # url.short_url = url.shorten_url
  # @url = Url.new(params[:url])
  if url.save
    return url.to_json
    # redirect '/'
  else
    status 400
    return url.errors.full_messages.to_json
  end
end

# i.e. /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  p params
  url = Url.find_by(short_url: params[:short_url])
  url.click_count += 1
  url.save
  if
    (url.long_url =~ /[h][t][t][p]s?:\W\W/).nil?
     x = url.long_url.prepend("http://")
     redirect x
  else
     !(url.long_url =~ /[h][t][t][p]s?:\W\W/).nil?
     redirect url.long_url
  end
end
