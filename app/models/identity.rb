# == Schema Information
#
# Table name: identities
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  email             :string(255)
#  password_digest   :string(255)
#  confirmation_code :string(255)
#  confirmed         :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#

class Identity < OmniAuth::Identity::Models::ActiveRecord
  # Validations
  validates :email, presence: true, uniqueness: true, email: true
  validates :name, presence: true

  before_validation :generate_confirmation_code, on: :create

  def email=(email)
    write_attribute(:email, email.downcase)
  end

  def info
    {
      "name" => self.name,
      "email" => self.email,
      "confirmed" => self.confirmed
    }
  end

  def confirm!
    update_attribute(:confirmed, true)
  end

  def user
    User.find_by_email(self.email)
  end

  private

  def generate_confirmation_code
    self.confirmation_code = SecureRandom.hex(15)
  end
end
