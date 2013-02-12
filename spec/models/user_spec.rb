require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }

  describe '.from_auth' do
    it 'should find a user for which a provider/uid matched authentication exists' do
      auth = FactoryGirl.create(:authentication)
      User.from_auth('provider' => auth.provider, 'uid' => auth.uid).should == auth.user
    end

    context 'email match' do
      before do
        @user = FactoryGirl.create(:user,
                                   :email => "yedingding@gmail.com",
                                   :authentications => [Authentication.new(:provider => 'github', :uid => '10017')])
      end

      subject do
        User.from_auth(
          {
            'provider' => 'identity',
            'info' => {
              'name'    => 'Dingding Ye',
              'email'   => 'yedingding@gmail.com',
              'confirmed' => false
            }
          }.with_indifferent_access
        )
      end

      it { should == @user }

      its(:authentications) { should have(2).items }
    end

    context 'user creation' do
      let(:full_auth) do
        {
          'provider' => 'identity',
          'info' => {
            'name' => 'Dingding Ye',
            'email' => 'dingding@pragmatic.ly',
            'confirmed' => false
          }
        }.with_indifferent_access
      end

      let(:partial_auth) { full_auth.merge('info' => {'name' => 'Dingding Ye'}) }

      it "should create the user" do
        expect {
          User.from_auth(full_auth)
        }.to change(User, :count).by(1)
      end

      it 'should create an incomplete record if all info is not present' do
        expect {
          User.from_auth(partial_auth)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
