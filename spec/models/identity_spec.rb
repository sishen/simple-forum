require 'spec_helper'

describe Identity do
  subject { FactoryGirl.create(:identity, email: 'TEST@YEDINGDING.COM') }

  it { should_not be_confirmed }
  its(:email) { should == "test@yedingding.com" }
  its(:user) { should_not be_nil }

  it "should confirm the user" do
    subject.confirm!
    subject.should be_confirmed
  end
end
