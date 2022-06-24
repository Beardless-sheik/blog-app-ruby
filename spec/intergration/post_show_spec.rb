feature "User Post Page" do
  background do
    @user = User.create(Name: 'Robert', Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png', Bio: 'Developer from Zambia',
      email: 'test@email.com', password: 'password', Posts_Counter: 5, confirmed_at: Time.now, role: 'admin')
    @user1 = User.create(Name: 'Alick', Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png', Bio: 'Developer from Zambia',
      email: 'test1@email.com', password: 'password', Posts_Counter: 7, confirmed_at: Time.now, role: 'admin')
    @user2 = User.create(Name: 'Billy', Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png', Bio: 'Developer from Zambia',
        email: 'test2@email.com', password: 'password',Posts_Counter: 8, confirmed_at: Time.now, role: 'admin')
    @post1 = Post.create(Title: 'First Post', Text: 'My text 1', AuthorId_id: @user.id)
    @comment1 = Comment.create(text: 'Comment One', author:@user1, post:@post1)
    Post.create(Title: 'Second Post', Text: 'My text 2', AuthorId_id: @user.id)
    Post.create(Title: 'Third Post', Text: 'My text 3', AuthorId_id: @user.id)
    
    # Use Devise Helper Method To LogIn
    login_as(@user, :scope => :user)
    visit post_path(@post1.id)
  end

  scenario "I can see the post's title" do
    expect(page).to have_content @post1.Title
  end

  scenario "I can see who wrote the post" do
    expect(page).to have_content @post1.author.Name
  end

  scenario "I can see how many comments it has" do
    expect(page).to have_content @post1.Comments_Counter
  end

  scenario "I can see how many likes it has" do
    expect(page).to have_content @post1.Likes_Counter
  end

  scenario "I can see the post body" do
    expect(page).to have_content @post1.Text
  end

  scenario "I can see the username of each commentor" do
    @post1.comments.each do |comment|
      expect(page).to have_content comment.author.Name
    end
  end

  scenario "I can see the comment each commentor left" do
    @post1.comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end
