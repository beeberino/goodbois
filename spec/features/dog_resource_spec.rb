require 'rails_helper'

describe 'Dog resource', type: :feature do
  include Devise::Test::IntegrationHelpers

  after(:each) do
    sign_out :user
  end

  it 'can create a profile' do
    user = FactoryBot.create(:user)
    sign_in user
    visit new_dog_path
    fill_in 'Name', with: 'Speck'
    fill_in 'Description', with: 'Just a dog'
    attach_file 'Image', 'spec/fixtures/images/speck.jpg'
    click_button 'Create Dog'
    expect(Dog.count).to eq(1)
  end

  it 'can edit a dog profile' do
    user = FactoryBot.create(:user)
    sign_in user
    dog = create(:dog, owner: user)
    visit edit_dog_path(dog)
    fill_in 'Name', with: 'Speck'
    click_button 'Update Dog'
    expect(dog.reload.name).to eq('Speck')
  end

  it 'can delete a dog profile' do
    user = FactoryBot.create(:user)
    sign_in user
    dog = create(:dog, owner: user)
    visit dog_path(dog)
    click_link "Delete #{dog.name}'s Profile"
    expect(Dog.count).to eq(0)
  end
end
