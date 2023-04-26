require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  before :each do
    visit home_index_path
  end

  it 'should display the home page' do
    expect(page).to have_content('Budget App')
  end

  it 'should display the sign up button' do
    expect(page).to have_content('SIGN UP')
  end

  it 'should display the log in button' do
    expect(page).to have_content('LOG IN')
  end

  it 'should display sign up forms' do
    click_on 'SIGN UP'
    expect(page).to have_content('REGISTER')
  end

  it 'should display log in forms' do
    click_on 'LOG IN'
    expect(page).to have_content('LOGIN')
  end
end
