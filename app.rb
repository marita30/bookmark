require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

	get '/' do
		'Bookmark Manager'
	end

	get '/bookmarks' do
		#print the ENV variable
		#p 	ENV
		
		@bookmarks = Bookmark.all
		erb :'bookmarks/index'
	end

	get '/bookmarks/new' do
		Bookmark.create(url: params[:url], title: params[:title])
		erb :"bookmarks/new"
	end

	post '/bookmarks/new' do
		Bookmark.create(url: params[:url], title: params[:title])
		redirect '/bookmarks'
	end

	run! if app_file == $0
end
