require 'securerandom'

class User <  ActiveRecord::Base
  after_initialize :ensure_session_token

  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  validates :session_token, presence: true, uniqueness: true

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end