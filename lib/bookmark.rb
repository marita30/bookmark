
require_relative 'database_connection'

class Bookmark 

	attr_reader :id, :url, :title

	def initialize(id:, url:, title:)
		@id = id
		@url = url
		@title = title
	end

	def self.all

		result = DatabaseConnection.query("SELECT * FROM bookmarks")
		result.map do |bookmark|
			Bookmark.new(url: bookmark['url'], title: bookmark['title'], id: bookmark['id'])
		end
	end

	def self.create(url:, title:)
	 	
	 	result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title;")
	 	Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	end

	def self.update(id:, title:, url:)

		result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
		Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	end

	def self.find(id:)

		result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")

		Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	end

end