require 'rails_helper'

RSpec.describe User, type: :model do
  context "user preparing" do
  	it "should save user" do
  		User.valid_user.save
  	end
  end
end
