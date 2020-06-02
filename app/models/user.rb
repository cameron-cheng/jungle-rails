class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    user = User.where("LOWER(email) = ?", email.downcase.strip).first
    if user && user.authenticate(password)
      return user
    end
    nil
  end
end
