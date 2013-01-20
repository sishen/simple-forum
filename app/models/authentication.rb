# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  provider   :string(16)
#  uid        :string(64)
#  token      :string(255)
#  secret     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Authentication < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :provider, uniqueness: { scope: :user_id }
  validates :uid, uniqueness: { scope: :user_id }

  # Class Methods
  def self.locate(auth)
    authentication = where(uid: auth['uid'].to_s, provider: auth['provider']).includes(:user).first
    if authentication
      credentials = auth['credentials']
      authentication.update_attributes(token: credentials.try(:[], 'access_token') || credentials.try(:[], 'token'),
                                       secret: credentials.try(:[], 'access_secret'))
    end
    authentication
  end

  def self.build_from_auth(auth)
    credentials = auth['credentials']
    Authentication.new(
      provider: auth['provider'].to_s,
      uid: auth['uid'].to_s,
      token: credentials.try(:[], 'access_token') || credentials.try(:[], 'token'),
      secret: credentials.try(:[], 'access_secret')
    )
  end
end
