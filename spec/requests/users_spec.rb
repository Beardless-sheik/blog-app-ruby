require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'test GET /users' do
    before(:example) { get users_path }

    it 'return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the rendered template' do
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Users here')
    end
  end

  describe 'test GET /users/:id' do
    before(:example) { get user_path(1) }

    it 'return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the rendered template' do
      expect(response).to render_template('show')
    end

    it 'return correct placeholder text' do
      expect(response.body).to include('Comments: x, Likes: y')
    end
  end
end