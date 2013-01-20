# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  # Associations
  has_many :authentications, dependent: :destroy

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  accepts_nested_attributes_for :authentications, allow_destroy: true

  class << self
    def matches?(request)
      !!request.env['rack.session'][:user_id]
    end

    def from_auth(auth)
      locate_from_auth(auth) || create_from_auth(auth)
    end

    def locate_from_auth(auth)
      locate_by_authentication(auth) ||
        locate_by_email(auth)
    end

    def locate_by_authentication(auth)
      Authentication.locate(auth).try(:user)
    end

    def locate_by_email(auth)
      return nil unless auth['info'].try(:[], 'email')
      if user = User.find_by_email(auth['info']['email'])
        user.authentications << Authentication.build_from_auth(auth)
      end
      user
    end

    def create_from_auth(auth)
      user = User.create!(
        name: auth['info']['name'],
        email: auth['info']['email'],
        authentications_attributes: [Authentication.build_from_auth(auth).attributes]
      )
    end
  end
end
