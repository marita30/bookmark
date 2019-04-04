require 'pg'

feature 'Viewing bookmarks' do

	scenario 'Visiting the index page' do
		visit('/')
		expect(page).to have_content "Bookmark Manager"
	end

	scenario 'A user can see bookmarks' do
		connection = PG.connect(dbname: 'bookmark_manager_test')

		#add the test data
		connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
		connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
		connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

		visit('/bookmarks')

		expect(page).to have_content "http://www.makersacademy.com"
		expect(page).to have_content "http://www.destroyallsoftware.com"
		expect(page).to have_content "http://www.google.com"
	end
end