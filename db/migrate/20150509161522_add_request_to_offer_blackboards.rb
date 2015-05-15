class AddRequestToOfferBlackboards < ActiveRecord::Migration
  def change
    add_column :offer_blackboards, :request, :boolean
  end
end
