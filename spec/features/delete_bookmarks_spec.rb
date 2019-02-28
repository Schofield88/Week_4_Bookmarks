require 'pg'

feature 'Deleting bookmarks' do
  scenario 'A user can delete bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")

    visit('/bookmarks')
    
    click_button("Delete")
    expect(page).to have_link('Makers')
    expect(page).to have_link('Destroy')
    expect(page).to have_link('Google')
  end
end
