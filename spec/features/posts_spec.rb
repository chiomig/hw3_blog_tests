require 'rails_helper'

feature "posts/index" do
  scenario "renders a list of posts" do
    create(:user)
    create(:static_post)

    visit posts_path

    expect(page).to have_content('my awesome post')
    expect(page).to have_content('my awesome post article text')
  end
end

feature 'New Post' do
  scenario 'user adds a new post' do
    user = create(:user)

    visit posts_path

    expect{
      click_link 'New Post'
      fill_in 'Title', with: 'My Post Title'
      fill_in 'Article', with: 'This is some article text.'
      select(user.email, from: 'post_user_id')
      click_button('Create Post')
    }.to change(Post, :count).by(1)

    expect(current_path).to eq(post_path(Post.last.id))
    expect(page).to have_content('My Post Title')

  end
end

feature 'Edit Post' do
  let(:my_post) { create(:static_post) }

  scenario 'User edits post' do
    user = create(:user)
    visit post_path(my_post)
    expect(page).to have_content('my awesome post')

    click_link("Edit")

    fill_in 'Title', with: 'Edited Title'
    fill_in "Article", with: 'Edited article text.'
    select(user.email, from: 'post_user_id')
    click_button('Update Post')

    expect(current_path).to eq(post_path(my_post.id))

    expect(page).to have_content('Edited Title')
  end

end
