require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validation Tests For the Like model' do
    before(:each) do
      @like = Like.new(AuthorId_id: 11, PostId_id: 32)
    end

    before { @like.save }

    it 'If Author_Id is not an integer, expect failure and non save' do
      @like.AuthorId_id = 'Test'
      expect(@like).to_not be_valid
    end

    it 'If Post_Id is integer, expect failure and non save' do
      @like.PostId_id = 'Test'
      expect(@like).to_not be_valid
    end
  end
end
