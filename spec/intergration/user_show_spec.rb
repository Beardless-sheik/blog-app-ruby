feature 'User Index Page' do
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
    @comment1 = Post.create(Title: 'First Post', Text: 'My text 1', AuthorId_id: @user.id)
    Post.create(Title: 'Second Post', Text: 'My text 2', AuthorId_id: @user.id)
    Post.create(Title: 'Third Post', Text: 'My text 3', AuthorId_id: @user.id)
    login_as(@user, scope: :user) # Use Devise Helper Method To LogIn
    visit user_path(@user.id)
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content 'Number of Posts: 8'
  end

  scenario "I can see the user's bio" do
    expect(page).to have_content 'Developer from Zambia'
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    click_button 'See all posts'
    expect(page).to have_current_path("/users/#{@user.id}")
  end
end

feature 'User Index Page' do
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
    @comment1 = Post.create(Title: 'First Post', Text: 'My text 1', AuthorId_id: @user.id)
    Post.create(Title: 'Second Post', Text: 'My text 2', AuthorId_id: @user.id)
    Post.create(Title: 'Third Post', Text: 'My text 3', AuthorId_id: @user.id)
    login_as(@user, scope: :user) # Use Devise Helper Method To LogIn
    visit user_path(@user.id)
  end

  scenario "I can see the user's first 3 posts" do
    expect(page).to have_content 'First Post'
    expect(page).to have_content 'Second Post'
    expect(page).to have_content 'Third Post'
  end
end

feature 'User Index Page' do
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
    @comment1 = Post.create(Title: 'First Post', Text: 'My text 1', AuthorId_id: @user.id)
    Post.create(Title: 'Second Post', Text: 'My text 2', AuthorId_id: @user.id)
    Post.create(Title: 'Third Post', Text: 'My text 3', AuthorId_id: @user.id)
    login_as(@user, scope: :user) # Use Devise Helper Method To LogIn
    visit user_path(@user.id)
  end

  scenario "I can see a button that lets me view all of a user's posts." do
    expect(page).to have_button('See all posts')
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    click_on @comment1.Title
    expect(page).to have_current_path("/posts/#{@comment1.id}")
  end
  scenario "I can see the user's profile picture" do
    @profile_image = first('.user-profile-picture')
    expect(@profile_image[:src]).to eq('https://dummyimage.com/250/9f9ede/000000')
  end
end
