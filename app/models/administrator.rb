require 'authenticate_module'
class Administrator < ActiveRecord::Base
  validates :password,:confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password
  include Authenticate
  def self.authenticate(name,password)
    if administrator = find_by_name(name)
      if administrator.hashed_password == Authenticate.encrypt_password(password,administrator.salt)
        administrator
      end
    end
  end
end
