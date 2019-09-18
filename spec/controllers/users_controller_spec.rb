require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {attributes_for(:user)}
  let(:invalid_attributes) { attributes_for(:invalid_user) }

  describe "GET #index" do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns all users for user' do
      user = create(:user)

      get :index

      expect(assigns(:users)).not_to be_nil
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      my_user = create(:user)

      get :show, params: {id: my_user.to_param}

      expect(assigns(:user)).to eq(my_user)
    end

    it "renders the :show template" do
      my_user = create(:user)

      get :show, params: { id: my_user.to_param }

      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET #edit' do
    it "assigns the requested user as @user" do
      my_user = create(:user)

      get :edit, params: {id: my_user.to_param}

      expect(assigns(:user)).to eq(my_user)
    end

    it "renders the :edit template" do
      my_user = create(:user)

      get :edit, params: { id: my_user.to_param }

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it 'persists new user' do
        expect{
          post :create, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
      end

      it 'redirects to show page' do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(assigns(:user))
      end
    end

    context 'with invalid attributes' do
      it 'does not persist user' do
        expect{
          post :create, params: {user: invalid_attributes}
        }.not_to change(User, :count)
      end

      it 're-renders :new template' do
        post :create, params: {user: invalid_attributes}
        expect(response).to render_template(:new)
      end
    end

  end

  describe '#PATCH #update' do
    let(:my_user) { create(:user) }
    let(:new_attributes) { attributes_for(:user) }

    context 'with valid params' do
      it 'updates the selected user' do
        patch :update, params: { id: my_user.to_param, user: new_attributes }

        my_user.reload

        expect(my_user.username).to eq(new_attributes[:username])
        expect(my_user.email).to eq(new_attributes[:email])
      end

      it 'redirects to the user' do
        patch :update, params: { id: my_user.to_param, user: new_attributes }

        my_user.reload

        expect(response).to redirect_to(my_user)
      end
    end

    context 'with invalid params' do
      it 'does not update the user' do
        patch :update, params: {id: my_user.to_param, user: invalid_attributes}
        expect(assigns(:user)).to eq(my_user)
      end

      it 're-renders the edit template' do
        patch :update, params: {id: my_user.to_param, user: invalid_attributes}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:my_user) {build(:user)}

    it "destroys the requested user" do
      my_user.save
      expect {
        delete :destroy, params: {id: my_user.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      my_user.save
      delete :destroy, params: {id: my_user.to_param}
      expect(response).to redirect_to(users_path)
    end
  end
end
