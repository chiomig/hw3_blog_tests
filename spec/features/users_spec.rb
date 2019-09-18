require 'rails_helper'

feature "users/index" do
  scenario "renders a list of users" do
    user = create(:user)

    visit users_path

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.email)
  end
end

  feature 'New User' do
    scenario 'user adds a new user' do
      user = create(:user)

      visit users_path

      expect{
        click_link 'New User'
        fill_in 'Username', with: 'awesomeuser1'
        fill_in 'Email', with: 'useremail@email.com'
        click_button('Create User')
      }.to change(User, :count).by(1)

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content('awesomeuser1')

    end
  end

  feature 'Edit User' do

    scenario 'User edits user' do
      user = create(:user)
      visit user_path(user)
      expect(page).to have_content(user.username)

      click_link("Edit")

      fill_in 'Username', with: 'editedusername'
      fill_in "Email", with: 'editedemail@email.com'
      click_button('Update User')

      expect(current_path).to eq(user_path(user.id))

      expect(page).to have_content('editedusername')
    end

  end
