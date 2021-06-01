require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "it returns a success response" do
      get "/users/"
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do
    it 'it returns a success response' do
      user = User.create(first_name: 'First', last_name: 'Last', email: 'anjali@gmail.com')
      get '/users/show', params: { id: user.to_param }
      expect(response).to have_http_status(:success)
    end
  end
end
