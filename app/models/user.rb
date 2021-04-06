class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  # validates :password, length: { minimum: 8 }
  validates_uniqueness_of :email


  def send_password_reset
    self[:password_reset_token] = generate_base64_token
    self.password_reset_sent_at = Time.zone.now
    save!
    # byebug
  NotifierMailer.rescue(self).deliver_now
end

def password_token_valid?
  (self.password_reset_sent_at + 1.hour) > Time.zone.now
end

def reset_password(password)
  self.password_reset_token = nil
  self.password = password
  save!
end

private

def generate_base64_token
  test = SecureRandom.urlsafe_base64
end
end
