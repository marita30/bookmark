require 'bookmark'

describe Bookmark do
	describe '.all' do
		it 'return all bookmarks' do

			expect(bookmarks).to include("http://www.facebook.com")
			expect(bookmarks).to include("http://www.destroyallsoftware.com")
			expect(bookmarks).to include("http://www.google.com")
		end
	end
end
	