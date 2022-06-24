feature "User Index Page" do
  background do
    @user = User.create(Name: 'Robert', Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png', Bio: 'Developer from Zambia',
      email: 'test@email.com', password: 'password', Posts_Counter: 5, confirmed_at: Time.now, role: 'admin')
    @user1 = User.create(Name: 'Alick', Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png', Bio: 'Developer from Zambia',
      email: 'test1@email.com', password: 'password', Posts_Counter: 7, confirmed_at: Time.now, role: 'admin')
    @user2 = User.create(Name: 'Billy', Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png', Bio: 'Developer from Zambia',
        email: 'test2@email.com', password: 'password',Posts_Counter: 8, confirmed_at: Time.now, role: 'admin')

    
    # Use Devise Helper Method To LogIn
    login_as(@user, :scope => :user)
    visit '/'
  end

  scenario "I can see the username of all other users" do
    expect(page).to have_content('Robert')
    expect(page).to have_content('Billy')
  end

  scenario  "I can see the profile picture for each user" do
    @profile_image = first('.profile-picture')
    expect(@profile_image[:src]).to eq('https://dummyimage.com/250/9f9ede/000000')
  end

  scenario "I can see the number of posts each user has written" do   
    expect(page).to have_content 'Number of Posts: 7'
    expect(page).to have_content 'Number of Posts: 8'
  end

  scenario "When I click on a user, I am redirected to that user's show page." do
    click_on @user.Name, match: :first
    expect(page).to have_current_path("/users/#{@user.id}")
  end
end