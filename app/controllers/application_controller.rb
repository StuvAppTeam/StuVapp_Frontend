class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
  #Überprüft ob der aktuell angemeldet User ein Admin ist
  def admin
    unless current_user.admin?
      sign_out current_user

      redirect_to root_path

      return false
    end
  end

  # Funktion zum überprüfen ob der aktuelle User auch Author entspricht, wenn nicht
  # Message und weiterleiten zum aktuellen Punkt
  def authorize
    @offer_blackboard = OfferBlackboard.find(params[:id])
    unless @offer_blackboard.user_id == current_user.id
      flash[:notice] = "Sie sind nicht Berechtigt diesen Eintrag zu ändern!!"
      redirect_to offer_blackboard_path # or anything you prefer
      return false # Important to let rails know that the controller should not be executed
    end
  end
end
