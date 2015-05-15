class StaticPagesController < ApplicationController
  def apartment_choice
  end

  def blackboard_choice
  end

  def about
  end

  def manage_ad
    @apartment = Apartment.where("user_id = ?", current_user.id)
    @blackboard = OfferBlackboard.where("user_id = ?", current_user.id)
  end

end
