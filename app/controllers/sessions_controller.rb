class SessionsController < ApplicationController
  skip_before_filter :user_authorize
  def new
  end

  def create
    if params[:user_type].nil?
      flash[:alert] = "choose type."
      redirect_to login_url
    else
      if user = Object.const_get(params[:user_type]).authenticate(params[:name],params[:password])
        session[:user_id] = user.id
        session[:user_type] = params[:user_type]
        if params[:user_type] == "Student"
          redirect_to stu_using_index_url
        else 
          if params[:user_type] == "Administrator"
            redirect_to admin_index_url
          end
        end
      else
        flash[:alert] = "wrong user name/password."
        redirect_to login_url
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to index, :notice => "logged out"
  end

end
