feature 'Viewing bookmarks' do
	scenario 'Visiting the index page' do
		visit('/')
		expect(page).to have_content "Bookmark Manager"
	end
end