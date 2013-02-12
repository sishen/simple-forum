require 'spec_helper'

describe 'the login process', type: :feature do
  let!(:identity) { FactoryGirl.create(:identity, email: 'yedingding@gmail.com') }

  before do
    visit('/')
    click_link("login-link")
  end

  it "should contain the login form" do
    page.should have_css("form.login")
  end

  context "unconfirmed user" do
    it "should fail to login due to unconfirmed" do
      within(".login") do
        fill_in "Email", with: 'yedingding@gmail.com'
        fill_in "Password", with: 'password'
      end
      click_button 'Log In'
      page.should have_content("Confirm your email address")
    end
  end

  context "confirmed user" do
    before do
      identity.confirm!
    end

    it "should log in" do
      within(".login") do
        fill_in "Email", with: 'yedingding@gmail.com'
        fill_in "Password", with: 'password'
      end
      click_button 'Log In'
      page.should have_content("Logout")
    end
  end
end
