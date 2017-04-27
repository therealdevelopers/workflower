require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #credits" do
    it "returns http success" do
      get :credits
      expect(response).to have_http_status(:success)
    end
  end

end
