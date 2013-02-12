# == Schema Information
#
# Table name: authentications
#
#  id         :integer         not null, primary key
#  provider   :string(16)
#  uid        :string(64)
#  token      :string(255)
#  secret     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Authentication do
  describe '.build_from_auth' do
    it 'should set attributes appropriately' do
      auth = Authentication.build_from_auth({
        'provider' => 'github',
        'uid' => 'dingding',
        'credentials' => {'access_token' => 'ddat', 'access_secret' => 'ddas'}
      })

      auth.provider.should == 'github'
      auth.uid.should == 'dingding'
      auth.token.should == 'ddat'
      auth.secret.should == 'ddas'
    end
  end
end
