require 'pg'

feature 'add bookmarks' do
  scenario 'A user can add bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")

    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.ft.com'
    fill_in 'title', with: 'Financial Times'
    click_button 'Submit'
    
    expect(page).to have_content('Financial Times')

  end
end
