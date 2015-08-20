class User < ActiveRecord::Base
  attr_reader :password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true, message: "password too short"}
  after_initialize :ensure_session_token

  def self.generate_session_token
    token = SecureRandom.urlsafe_base64
    until User.find_by(session_token: token).nil?
      token = SecureRandom.urlsafe_base64
    end
    token
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  has_many :notes,
    class_name: "Note",
    foreign_key: :user_id,
    primary_key: :id
end
