require 'pg'

def setup_test_database
	connection = PG.connect(dbname: 'bookmark_manager_test')	

	#clear the bookmarks table , porque necesitamos que en cada ejecucion se borre lo anterior y comensemos con una base de dato limpia.
	connection.exec("TRUNCATE bookmarks;")
end
