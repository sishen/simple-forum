require 'spec_helper'

describe 'the signup process', type: :feature do
  let(:user) { double(:identity, email: "yedingding@gmail.com", name: 'Dingding Ye', password: 'password') }

  before do
    visit('/')
    click_link("signup-link")
  end

  it "should contain the sign up form" do
    page.should have_css("form.new-user")
  end

  it "should successfully signup" do
    within(".new-user") do
      fill_in 'Email', with: user.email
      fill_in 'Name', with: user.name
      fill_in 'Password', with: user.password
    end
    click_button 'Create Account'
    page.should have_content("Confirm your email address")
  end
end
