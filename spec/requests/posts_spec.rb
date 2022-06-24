require 'rails_helper'

RSpec.describe 'Posts show page', :type => ['request', 'feature'] do
  before(:each) do
    User.destroy_all
    @user = User.create(Name: 'Mwape', Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png', Bio: 'Developer from Zambia',
                        email: 'test@email.com', password: 'password', confirmed_at: Time.now, role: 'admin')
    @user1 = User.create(Name: 'Lungu', Photo: 'profile.jpg', Bio: 'Developer from SA', email: 'test1@email.com',
                         password: 'password', confirmed_at: Time.now)
    Post.create(Title: 'My title', Text: 'My text', AuthorId_id: @user.id)
    @comment = Comment.create(text: 'My first comment', author: User.first, post: Post.first)
    @comment = Comment.create(text: 'My second comment', author: User.first, post: Post.first)
    @like = Like.create(AuthorId_id: User.first.id, PostId_id: Post.first.id)
    login_as(@user, :scope => :user)
  end

  describe 'test GET /users to #index' do
    before(:example) { get user_posts_path(@user.id) }

    it 'return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the rendered template' do
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Number of Posts')
    end
  end

  describe 'test GET /users/:id to #show' do
    before(:example) { get user_path(@user.id) }

    it 'return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the rendered template' do
      expect(response).to render_template('show')
    end

    it 'return correct placeholder text' do
      expect(response.body).to include('See all posts')
    end
  end
end
