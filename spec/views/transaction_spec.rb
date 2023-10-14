require 'rails_helper'

RSpec.describe 'Transactions page', type: :feature do
  before :each do
    @user = User.new(name: 'Mohamed', email: 'mohamed@gmail.com', password: 'password',
                     password_confirmation: 'password')

    @user.save

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    @category = Group.new(name: 'Food', user_id: @user.id)
    @category.save

    @transaction = Entity.new(name: 'Food', amount: 100, user_id: @user.id)

    @transaction.save

    visit entities_path
  end

  it 'should display the transactions page' do
    expect(page).to have_content('Categories')
  end

  it 'should display add new transaction button' do
    expect(page).to have_content('Add a new Transaction')
  end

  it 'should display the transaction form' do
    click_link 'Add a new Transaction'
    expect(page).to have_content('New transaction')
  end

  it 'should save the transaction' do
    click_link 'Add a new Transaction'
    fill_in 'Name', with: 'Food'
    fill_in 'Enter number', with: 100
    click_button 'Save'
    expect(page).to have_content('Transaction was successfully created')
  end
end
