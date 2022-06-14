require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for User model' do
    before(:each) do
      @user = User.new(Name: 'John')
    end

    before { @user.save }

    it 'If Name attributte not present, expect failure and non save' do
      @user.Name = nil
      expect(@user).to_not be_valid
    end

    it 'If Posts Counter is an Integer less than zero, expect failure and non save' do
      @user.Posts_Counter = -1
      expect(@user).to_not be_valid
    end

    it 'If Likes Counter Isnt an Integer, expect failure and non save' do
      @user.Posts_Counter = 'Q'
      expect(@user).to_not be_valid
    end

    it 'three_recent_posts Methods Should Return "0" Posts if no comments are present' do
      expect(@user.three_recent_posts.length).to eq(0)
    end
  end
end