class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Logged in as: #{@user["username"]}"
        redirect_to "/places"
      else
        flash["notice"] = "Incorrect email or password"
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Incorrect email or password"
      redirect_to "/sessions/new"
    end
  end

  def destroy
  end
end
  