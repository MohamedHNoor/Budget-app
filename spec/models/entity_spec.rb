require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.new(name: 'Mohamed', email: 'mohamed@gmail.com', password: 'password',
                     password_confirmation: 'password')

    @entity = Entity.new(name: 'entity', user_id: @user.id, amount: 100)
  end

  it 'name should be present' do
    @entity.name = ' '
    expect(@entity).not_to be_valid
  end

  it 'user_id should be present' do
    @entity.user_id = ' '
    expect(@entity).not_to be_valid
  end

  it 'amount should be present and greater than 0' do
    @entity.amount = ' '
    expect(@entity).not_to be_valid
    @entity.amount = -1
    expect(@entity).not_to be_valid
  end
end
