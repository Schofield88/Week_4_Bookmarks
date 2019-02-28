require "sinatra/base"
require_relative "./lib/bookmark.rb"

class BookmarkManager<Sinatra::Base
  get "/" do
    erb :index
  end

  get "/bookmarks" do

    @bookmarks = Bookmark.all

    erb :index

  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.add_bookmark(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end








  run! if app_file == $0
end
