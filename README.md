# Title of Proyect
_Bookmark(Marcadores) 📑 _
## Creating User Stories 🚹
```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks

As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager

As a user
So that I can keep my bookmarks relevant
I want to delete a bookmark

As a user
So I can change a bookmark in Bookmark Manager
I want to update a bookmark

As a user
So that the bookmarks I save are useful
I want to only save a valid URL

As a user
So that I can make interesting notes
I want to add a Comment to a Bookmark

As a user
So that I can categorize my bookmarks
I want to add a Tag to a Bookmark

As a user
So that I can find relevant bookmarks
I want to filter Bookmarks by a Tag

As a user
So that I can have a personalised bookmark list
I want to sign up with my email address
```
## Begin 🔧
* Creaing a work environment to be able to continue with the othe steps.
* Add file of class, test, Servidor and views.
* Add queries for the database:
```
# Type of fuctions 📁 :
CREATE 
INSERT
SELECT
DELETE
UPDATE
```
## Installation for the DataBase 🛠️
### DATA BASE 🏣
```

1- Connect to psql
2- Create the database using the psql command CREATE DATABASE bookmark_manager and bookmark_manager_test ;
3- Connect to the databases using the pqsl command \c bookmark_manager and bookmark_manager_test;
4- Run the queries . we have saved in the file db/migration/ in each DataBase;
```
## Execute ⚙️
* for initialize the server is ruby app.rb;
* for Initialize potsgre is psql -U postgres -h localhost;
* for create a new colunm is  ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);

## Entity Relationship Diagram 📌
The below diagram indicates that:
- A Bookmark *has many* Comments
- A Comment *belongs to* a Bookmark

## Autor  ✒️
** **Maria Jose CHavarria Bravo** - *Trabajo Inicial* - [marita30](https://github.com/marita30/bookmark)
