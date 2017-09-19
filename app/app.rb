require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get "/links" do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @links = Link.all
    erb :'links/index'
  end
end
