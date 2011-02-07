# == Schema Information
# Schema version: 20110206212724
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  country            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#


class User < ActiveRecord::Base

  attr_accessor :password, :salt
  attr_accessible :name, :email, :country, :password, :password_confirmation

  validates :name, :presence => true

  validates :email, :presence => true, :length => { :within => 6..40 },
  :uniqueness => { :case_sensitive => false }

  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }  


  before_save :encrypt_password



  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password) 
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    user && user.has_password?(submitted_password) ? user : nil
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
