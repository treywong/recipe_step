require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #signup_create" do
    let( :valid_params )          { { user: { username: "Something", email: "test@example.com", password: "infinite" }} }
    let( :invalid_params )        { { user: { username: "Something", email: "test@example.com", password: "inf" }} }


    context "when valid params" do
      it "should create a new user" do
        post :signup_create, params: valid_params
        expect(User.find_by(email: valid_params[:user][:email])).not_to eq nil
      end

      it "should redirect to root page" do
        post :signup_create, params: valid_params
        expect(response).to redirect_to( root_path )
      end
    end

    context "when invalid params" do
      it "should redirect back to sign up page" do
        post :signup_create, params: invalid_params
        expect(User.find_by(email: invalid_params[:user][:email])).to eq nil
        expect(response).to redirect_to( "/signup" )
      end
    end
  end

  describe "POST #login_check" do
    let( :valid_params )          { { user: { username: "Something", email: "test@example.com", password: "infinite" }} }
    let( :invalid_params_1 )        { { user: { username: "Something", email: "test@example.com", password: "inf" }} }
    let( :invalid_params_2 )        { { user: { username: "Something", email: "incorrect@wrong.com", password: "infinite" }} }
    let( :invalid_params_3 )        { { user: { username: "Something", email: "test@example.com", password: "INFINITE" }} }

    context "when valid params" do
      it "should be able to log in" do
        post :signup_create, params: valid_params
        post :login_check, params: valid_params
        expect(response).to redirect_to( root_path )
      end
    end

    context "when invalid params" do
      it "should not be able to log in and redirect back to login page due to incorrect password" do
        post :signup_create, params: valid_params
        post :login_check, params: invalid_params_1
        expect(response).to redirect_to( "/login" )
      end

      it "should not be able to log in and redirect back to login page due to incorrect email address" do
        post :signup_create, params: valid_params
        post :login_check, params: invalid_params_2
        expect(response).to redirect_to( "/login" )
      end

      it "should not be able to log in and redirect back to login page due to incorrect case sensitive password" do
        post :signup_create, params: valid_params
        post :login_check, params: invalid_params_3
        expect(response).to redirect_to( "/login" )
      end
    end
  end

end