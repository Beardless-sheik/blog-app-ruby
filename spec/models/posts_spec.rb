require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'For the Post model' do
    before(:each) do
      @user = User.new(Name: 'John', Bio: 'Teacher')
      @post = Post.new(author: @user, Title: 'Test', Text: 'testing', Likes_Counter: 7, Comments_Counter: 5)
    end

    before { @post.save }

    it 'If Title is not present, expect failure and non save' do
      @post.Title = nil
      expect(@post).to_not be_valid
    end

    it 'If title characters are more than 250 characters, expect failure and non save' do
      @post.Title = `TestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTesting
      TestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTesting
      TestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTesting
      TestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTesting
      TestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTestingTesting`
      expect(@post).to_not be_valid
    end

    it 'If Likes Counter Isnt an Integer, expect failure and non save' do
      @post.Likes_Counter = 'Q'
      expect(@post).to_not be_valid
    end

    it 'If Likes Counter Is an Integer less than zero, expect failure and non save' do
      @post.Likes_Counter = -9
      expect(@post).to_not be_valid
    end

    it 'If Comments Counter Is an Integer less than zero, expect failure and non save' do
      @post.Comments_Counter = -5
      expect(@post).to_not be_valid
    end

    it 'If Comments Counter Isnt an Integer, expect failure and non save' do
      @post.Comments_Counter = 'tesr'
      expect(@post).to_not be_valid
    end

    it 'Recent Comment Methods Should Return "0" Comments if no comments are present' do
      expect(@post.five_recent_comments.length).to eq(0)
    end
  end
end