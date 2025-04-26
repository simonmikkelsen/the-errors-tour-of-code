# backend/src/pages/duck.rb
require 'rails_helper'

RSpec.configure do |config|
  config.before_system(:use_database)
end

describe 'Duck Page' do
  context 'initial rendering' do
    it 'renders the duck page' do
      get '/ducks/new'
      expect(response.status_code).to eq(200)
    end
  end

  context 'creating a duck' do
    it 'allows creating a new duck' do
      visit '/ducks/new'

      # Simulate form input (replace with actual form elements)
      fill_in('duck_name', with: 'Fuzzy')
      fill_in('duck_description', with: 'A fluffy and friendly duck.')
      #simulate image upload
      attach_file('image', 'path/to/image.jpg', type: 'image/jpeg') #replace with actual image

      click_button 'Create Duck'

      # Assert that the duck was created
      expect(response.status_code).to eq(302) # Redirect after creation
      #TODO: Add logic to check and assert the duck is in the database
    end

    it 'displays a default duck if no name is entered' do
      visit '/ducks/new'
      click_button 'Create Duck'
      expect(page).to have_content("No duck name provided.")
    end
  end

  context 'image handling' do
    it 'accepts image uploads' do
      visit '/ducks/new'
      attach_file('image', 'test.png', type: 'image/png')
      click_button 'Create Duck'
    end
  end

  context 'error handling' do
    it 'handles missing name gracefully' do
      visit '/ducks/new'
      click_button 'Create Duck'
      expect(page).to have_content 'Please enter a name for the duck.'
    end
  end

end