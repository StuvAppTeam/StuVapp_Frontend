class AddPhoneToOfferBlackboards < ActiveRecord::Migration
  def change
    add_column :offer_blackboards, :phone, :string
  end
end
