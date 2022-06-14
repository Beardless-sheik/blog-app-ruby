require "rails_helper"

RSpec.describe Comment, type: :model do
  describe 'Validation Tests For the Comment model' do
    before(:each) do
      @comment = Comment.new(text: 'One comment', AuthorId_id: 11, PostId_id: 32)
    end

    before { @comment.save }

    it 'If Title is not present, expect failure and non save' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'If Author_Id is not an integer, expect failure and non save' do
      @comment.AuthorId_id = 'W'
      expect(@comment).to_not be_valid
    end

    it 'If Post_Id is integer, expect failure and non save' do
      @comment.PostId_id = 'Q'
      expect(@comment).to_not be_valid
    end
  end
end