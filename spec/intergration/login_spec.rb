feature 'Signing in' do
  background do
    visit 'users/sign_in'
  end

  scenario "Username, password inputs and the 'Submit' button exist" do
    expect(page).to have_css('.sign-in-inputs', count: 3)
  end

  scenario 'Clicking Submit without filling anything, I get a detailed error' do
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Clicking Submit button with incorrect data, I get a detailed error.' do
    fill_in 'UserName', with: 'nyirenda_a@zoho.com'
    fill_in 'Password', with: 'wrong_password'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Clicking Submit with correct data should be redirected to the root page.' do
    @user = User.create(Name: 'Sam', Photo: 'Ab-photo', Bio: 'Dev.', email: 'nyirenda_a@zoho.com',
                        password: '123test', confirmed_at: Time.now, role: 'admin')
    fill_in 'UserName', with: 'nyirenda_a@zoho.com'
    fill_in 'Password', with: '123test'
    click_button 'Log in'
    expect(page).to have_current_path('/')
  end
end
