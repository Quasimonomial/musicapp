require 'securerandom'
require 'bcrypt'

class User <  ActiveRecord::Base
  after_initialize :ensure_session_token

  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  validates :session_token, presence: true, uniqueness: true

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def find_by_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.is_password?(password) 
      user
    end
  end

  def is_password? password
    BCrypt::Password.new(self.password_digest) == password
  end

  def password= password
    self.password_digest = BCrypt::Password.create(password)

  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end


end