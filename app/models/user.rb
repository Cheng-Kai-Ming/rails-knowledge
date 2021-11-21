require "digest"
class User < ApplicationRecord
  #必填項目，使用validates並設定presence為true
  validates :email, :username, :password, presence:true

  private
  def encryption
    salted_password = "nokia3310#{self.password.reverse}sonyzone5"
    self.password = Digest::SHA1.Hexdigest(salted_password)
  end
end
