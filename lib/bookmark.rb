
require_relative 'database_connection'
require 'uri'
require_relative './comment'

class Bookmark 

	attr_reader :id, :url, :title

	def initialize(id:, url:, title:)
		@id = id
		@url = url
		@title = title
	end

	def self.all

		bookmarks = DatabaseConnection.query('SELECT * FROM bookmarks;')
		bookmarks.map do | bookmark|
			Bookmark.new(url: bookmark['url'], title: bookmark['title'], id: bookmark['id'])
		end			
	end

	def self.create(url:, title:)

		return false unless is_url?(url)
	 	
	 	result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title;")
	 	Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	end

	def self.delete(id:)
		
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end
		

	def self.update(id:, url:, title:)

		result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
		Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	end

	def self.find(id:)

		result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")

		Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	end

	def comments(comment_class = Comment)
		comment_class.where(bookmark_id: id)
	end

	private

	def self.is_url?(url)
		  url =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
	end

end