module Authenticate
  def password=(password)
    if password.present?
      generate_salt
      self.hashed_password = Authenticate.encrypt_password(password,salt)
    end
  end

  class << self
    def encrypt_password(password,salt)
      Digest::SHA2.hexdigest(password + salt)
    end
  end

  private
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
