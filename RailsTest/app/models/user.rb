require 'digest/md5'

class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :name
  
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  
  
	
  def self.authenticate(email, password)
    @user = User.find_by_email(email)
	
    if @user && @user.password == Digest::MD5.hexdigest(password)
      @user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password = Digest::MD5.hexdigest(password)
    end
  end
end

