require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  before :each do
    @user = User.new(name: 'Mohamed', email: 'mohamed@gmail.com', password: 'password',
                     password_confirmation: 'password')

    @user.save

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'should display the category page' do
    expect(page).to have_content('Categories')
  end

  it 'should display add new category button' do
    expect(page).to have_content('Add a new category')
  end

  it 'should display the category form' do
    click_link 'Add a new category'
    expect(page).to have_content('New Category')
  end
end
