require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password, if: :password_changed?
  
  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :email, on: :create
  validates_presence_of :username, on: :create
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  
  def password_changed?
    !@new_password.blank?
  end
  
  def self.authenticate(email, password)
    if user = find_by_email(email)
      if BCrypt::Password.new(user.hashed_password).is_password? password 
        return user
      end
    end
    
    return nil
  end
  
  private
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
  
end