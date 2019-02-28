require_relative "../../lib/bookmark.rb"
describe Bookmark do
  describe '.all' do

it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")
    bookmarks = Bookmark.all

    expect(bookmarks.first.title).to eq('Makers')
    expect(bookmarks.first.url).to eq('http://www.makersacademy.com')

    end

  end

  it 'adds new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")
    Bookmark.add_bookmark(url: 'http://www.yahoo.com', title: 'Yahoo')

    bookmarks = Bookmark.all

    expect(bookmarks.last.title).to eq('Yahoo')
    expect(bookmarks.last.url).to eq('http://www.yahoo.com')
  end
end
