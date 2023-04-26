require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'Mohamed', email: 'mohamed@gmail.com', password: 'password',
                     password_confirmation: 'password')

    @group = Group.new(name: 'group', user: @user)
  end

  it 'name should be present' do
    @group.name = ' '
    expect(@group).not_to be_valid
  end

  it 'user_id should be present' do
    @group.user_id = ' '
    expect(@group).not_to be_valid
  end

  it 'icon should be present' do
    @group.icon.attach(io: File.open(Rails.root.join('spec', 'images', 'test-image.jpg')), filename: 'test-image.jpg',
                       content_type: 'image/jpeg')
    expect(@group).to be_valid
  end
end
