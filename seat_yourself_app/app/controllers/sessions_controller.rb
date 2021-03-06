class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      session[:user_id] = user.id
      redirect_to restaurants_owner_list_path
      # , notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end


    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to products_url, notice: "Logged in!"
    # else
    #   flash.now[:alert] = "Invalid email or password"
    #   render "new"
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_url
    # , notice: "Logged out!"
  end
end
