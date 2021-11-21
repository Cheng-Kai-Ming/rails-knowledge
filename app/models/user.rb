require "digest"
class User < ApplicationRecord
  #必填項目，使用validates並設定presence為true
  validates :email, :username, :password, presence:true
  before_create :encryption

  def self.login(information)
    username = information[:username]
    password = information[:password]

    salted_password = "nokia3310#{password.reverse}sonyzone5"
    com_encryption = Digest::SHA1.hexdigest(salted_password)

    self.find_by(username: username, password: com_encryption)
  end
    

  private
  def encryption
    salted_password = "nokia3310#{self.password.reverse}sonyzone5"
    self.password = Digest::SHA1.hexdigest(salted_password)
  end
end
