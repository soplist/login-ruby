class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(user_params[:name])
    if user[:password] == params[:session][:password]
      render "create"
    else
      flash.now[:login_error] = "invalid username or password"
      render "new"
    end
  end
 
  private
    def user_params
      params.require(:session).permit(:name, :password)
    end
end
