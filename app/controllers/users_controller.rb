class UsersController < ApplicationController
  def sign_up
    @user = User.new   
  end

  def account_check
    clean_params = params.require(:user).permit(:email, :username, :password)
    @user = User.new(clean_params)


    #此時註冊系統只要隨便打什麼，都可以過關
    #而@user.save就是存進資料庫因此會經過
    #Model，所以在model要進行驗證。    
    if @user.save
      redirect_to "/" 
    else
      render :sign_up
    end
  end

  def sign_in
    @user = User.new
    
  end
end