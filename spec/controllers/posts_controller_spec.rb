require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_attributes) {attributes_for(:post)}
  let(:invalid_attributes) { attributes_for(:invalid_post) }

  describe "GET #index" do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns all posts for user' do
      user = create(:user)

      get :index

      expect(assigns(:posts)).not_to be_nil
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      my_post = create(:post)

      get :show, params: {id: my_post.to_param}

      expect(assigns(:post)).to eq(my_post)
    end

    it "renders the :show template" do
      my_post = create(:post)

      get :show, params: { id: my_post.to_param }

      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new post to @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'GET #edit' do
    it "assigns the requested post as @post" do
      my_post = create(:post)

      get :edit, params: {id: my_post.to_param}

      expect(assigns(:post)).to eq(my_post)
    end

    it "renders the :edit template" do
      my_post = create(:post)

      get :edit, params: { id: my_post.to_param }

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    let(:user) {create(:user)}
    let(:valid_attributes) { attributes_for(:post, user_id: user.id) }

    context "with valid attributes" do
      it 'persists new post' do
        expect{
          post :create, params: {post: valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it 'redirects to show page' do
        post :create, params: { post: valid_attributes }
        expect(response).to redirect_to(assigns(:post))
      end
    end

    context 'with invalid attributes' do

      it 'does not persist post' do
        expect{
          post :create, params: {post: invalid_attributes}
        }.not_to change(Post, :count)
      end

      it 're-renders :new template' do
        post :create, params: {post: invalid_attributes}
        expect(response).to render_template(:new)
      end

    end
  end

  describe '#PATCH #update' do
    let(:my_post) { create(:post) }
    let(:new_attributes) { attributes_for(:post) }

    context 'with valid params' do
      it 'updates the selected post' do
        patch :update, params: { id: my_post.to_param, post: new_attributes }

        my_post.reload

        expect(my_post.title).to eq(new_attributes[:title])
        expect(my_post.article).to eq(new_attributes[:article])
      end

      it 'redirects to the post' do
        patch :update, params: { id: my_post.to_param, post: new_attributes }

        my_post.reload

        expect(response).to redirect_to(my_post)
      end
    end

    context 'with invalid params' do
      it 'does not update the post' do
        patch :update, params: {id: my_post.to_param, post: invalid_attributes}
        expect(assigns(:post)).to eq(my_post)
      end

      it 're-renders the edit template' do
        patch :update, params: {id: my_post.to_param, post: invalid_attributes}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:my_post) {build(:post)}

    it "destroys the requested post" do
      my_post.save
      expect {
        delete :destroy, params: {id: my_post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      my_post.save
      delete :destroy, params: {id: my_post.to_param}
      expect(response).to redirect_to(posts_path)
    end
  end
end
