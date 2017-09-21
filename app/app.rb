ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative "data_mapper_setup"

class BookmarkManager < Sinatra::Base

  get "/links" do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @links = Link.all
    erb :"/links/index"
  end

  get "/links/new" do
    erb :"/links/new"
  end

  # post "/links" do
  #   Link.create(url: params[:url], title: params[:title])
  #   redirect "/links"
  # end

  get "/tags/:name" do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :"links/index"
  end

  post "/links" do
    link = Link.new(url: params[:url], # create a link
                    title: params[:title])
    tag = Tag.new(name: params[:tags]) # create a tag for the link
    link.tags << tag  # adding the tag to the link's DataMapper collection
    link.save # saving the link
    redirect to("/links")
  end

end
