class ApplicationController < ActionController::Base
  include SessionsHelper
  def authenticate_user
    unless current_user
      flash[:danger] = "Impossible tant que vous n'êtes pas connecté !"
      redirect_to new_session_path
    end
  end
end
