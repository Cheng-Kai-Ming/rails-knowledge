module UserHelper
  def sign_in_or_not?
    session[:snoopy].present?
  end
end