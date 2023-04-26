require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Mohamed', email: 'mohamed@gmail.com', password: 'password',
                     password_confirmation: 'password')
  end

  it 'name should be present' do
    @user.name = ' '
    expect(@user).not_to be_valid
  end

  it 'email should be present' do
    @user.email = ' '
    expect(@user).not_to be_valid
  end

  it 'password should be present' do
    @user.password = ' '
    expect(@user).not_to be_valid
  end

  it 'password_confirmation should match password' do
    @user.password_confirmation = ' '
    expect(@user).not_to be_valid
  end
end
