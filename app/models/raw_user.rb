class RawUser < ApplicationRecord
  
  def send_password_reset
    self[:token] = generate_base64_token
    save!
    NotifierMailer.legacy(self).deliver_now
    # self.password_reset_sent_at = Time.zone.now
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
