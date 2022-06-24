feature 'User Post Page' do
  background do
    @user = User.create(Name: 'Robert',
                        Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                        Bio: 'Developer from Zambia', email: 'test@email.com', password: 'password', Posts_Counter: 5,
                        confirmed_at: Time.now, role: 'admin')
    @user1 = User.create(Name: 'Alick',
                         Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                         Bio: 'Developer from Zambia', email: 'test1@email.com', password: 'password', Posts_Counter: 7,
                         confirmed_at: Time.now, role: 'admin')
    @user2 = User.create(Name: 'Billy',
                         Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                         Bio: 'Developer from Zambia', email: 'test2@email.com', password: 'password', Posts_Counter: 8,
                         confirmed_at: Time.now, role: 'admin')
    @post1 = Post.create(Title: 'First Post', Text: 'My text 1', AuthorId_id: @user.id)
    @comment1 = Comment.create(text: 'Comment One', author: @user1, post: @post1)
    Post.create(Title: 'Second Post', Text: 'My text 2', AuthorId_id: @user.id)
    Post.create(Title: 'Third Post', Text: 'My text 3', AuthorId_id: @user.id)
    login_as(@user, scope: :user) # Use Devise Helper Method To LogIn
    visit user_posts_path(@user.id)
  end

  scenario "I can see the user's profile picture." do
    @profile_image = first('.profile-picture')
    expect(@profile_image[:src]).to eq('https://dummyimage.com/250/9f9ede/000000')
  end

  scenario "I can see the user's username" do
    expect(page).to have_content @user.Name
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content 'Number of Posts : 8'
  end
end

feature 'User Post Page' do
  background do
    @user = User.create(Name: 'Robert',
                        Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                        Bio: 'Developer from Zambia', email: 'test@email.com', password: 'password', Posts_Counter: 5,
                        confirmed_at: Time.now, role: 'admin')
    @user1 = User.create(Name: 'Alick',
                         Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                         Bio: 'Developer from Zambia', email: 'test1@email.com', password: 'password', Posts_Counter: 7,
                         confirmed_at: Time.now, role: 'admin')
    @user2 = User.create(Name: 'Billy',
                         Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                         Bio: 'Developer from Zambia', email: 'test2@email.com', password: 'password', Posts_Counter: 8,
                         confirmed_at: Time.now, role: 'admin')
    @post1 = Post.create(Title: 'First Post', Text: 'My text 1', AuthorId_id: @user.id)
    @comment1 = Comment.create(text: 'Comment One', author: @user1, post: @post1)
    Post.create(Title: 'Second Post', Text: 'My text 2', AuthorId_id: @user.id)
    Post.create(Title: 'Third Post', Text: 'My text 3', AuthorId_id: @user.id)
    login_as(@user, scope: :user) # Use Devise Helper Method To LogIn
    visit user_posts_path(@user.id)
  end
  scenario "I can see some of the post's body" do
    expect(page).to have_content @post1.Text
  end

  scenario 'I can see the first comments on a post' do
    expect(page).to have_content @comment1.text
  end

  scenario 'I can see how many comments a post has' do
    expect(page).to have_content 'Comments: 0'
  end
end

feature 'User Post Page' do
  background do
    @user = User.create(Name: 'Robert',
                        Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                        Bio: 'Developer from Zambia', email: 'test@email.com', password: 'password', Posts_Counter: 5,
                        confirmed_at: Time.now, role: 'admin')
    @user1 = User.create(Name: 'Alick',
                         Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                         Bio: 'Developer from Zambia', email: 'test1@email.com', password: 'password', Posts_Counter: 7,
                         confirmed_at: Time.now, role: 'admin')
    @user2 = User.create(Name: 'Billy',
                         Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                         Bio: 'Developer from Zambia', email: 'test2@email.com', password: 'password', Posts_Counter: 8,
                         confirmed_at: Time.now, role: 'admin')
    @post1 = Post.create(Title: 'First Post', Text: 'My text 1', AuthorId_id: @user.id)
    @comment1 = Comment.create(text: 'Comment One', author: @user1, post: @post1)
    Post.create(Title: 'Second Post', Text: 'My text 2', AuthorId_id: @user.id)
    Post.create(Title: 'Third Post', Text: 'My text 3', AuthorId_id: @user.id)
    login_as(@user, scope: :user) # Use Devise Helper Method To LogIn
    visit user_posts_path(@user.id)
  end

  scenario 'I can see how many likes a post has' do
    expect(page).to have_content 'Likes: 0'
  end

  scenario "I can see a post's title" do
    expect(page).to have_content @post1.Title
  end

  scenario "When I click on a post, it redirects me to that post's show page" do
    click_on @post1.Title
    expect(page).to have_current_path("/posts/#{@post1.id}")
  end
end
