require 'sinatra/base'
require './lib/bookmark'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
	enable :method_override

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

	get '/bookmarks/:id/edit' do
		@bookmark = Bookmark.find(id: params[:id])
		erb :'bookmarks/edit'
	end

	patch '/bookmarks/:id' do
		Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
		redirect('/bookmarks')
	end



	run! if app_file == $0
end
