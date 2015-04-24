class OfferBlackboardsController < ApplicationController
  #Filtert ob Benutzer angemeldet ist, außer show und index, diese wird immer angezeigt
  #before_filter :authenticate_user!, :except => [:show, :index]
  #Nur eigene Eintraege duerfen Editiert und gelöscht werden
  #before_action :authorize, :only => [:edit, :destroy]
  #before_action :set_offer_blackboard, only: [:show, :edit, :update, :destroy]

  #Funktion zum überprüfen ob der aktuelle User auch Author entspricht, wenn nicht
  #Message und weiterleiten zum aktuellen Punkt
  def authorize
    @offer_blackboard = OfferBlackboard.find(params[:id])
    unless @offer_blackboard.user_id == current_user.id
      flash[:notice] = "Sie sind nicht Berechtigt diesen Eintrag zu ändern!!"
      redirect_to offer_blackboard_path # or anything you prefer
      return false # Important to let rails know that the controller should not be executed
    end
  end


  # GET /offer_blackboards
  # GET /offer_blackboards.json
  def index
    if params[:search]
      @offer_blackboards = OfferBlackboard.search(params[:search], params[:condition], params[:category])
    else
      @offer_blackboards = OfferBlackboard.all
    end

  end

  # GET /offer_blackboards/1
  # GET /offer_blackboards/1.json
  def show
  end

  # GET /offer_blackboards/new
  def new
    @offer_blackboard = OfferBlackboard.new
  end

  # GET /offer_blackboards/1/edit
  def edit
  end

  # POST /offer_blackboards
  # POST /offer_blackboards.json
  def create
    @offer_blackboard = OfferBlackboard.new(offer_blackboard_params)

    respond_to do |format|
      if @offer_blackboard.save
        format.html { redirect_to @offer_blackboard, notice: 'Offer blackboard was successfully created.' }
        format.json { render :show, status: :created, location: @offer_blackboard }
      else
        format.html { render :new }
        format.json { render json: @offer_blackboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offer_blackboards/1
  # PATCH/PUT /offer_blackboards/1.json
  def update
    respond_to do |format|
      if @offer_blackboard.update(offer_blackboard_params)
        format.html { redirect_to @offer_blackboard, notice: 'Offer blackboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer_blackboard }
      else
        format.html { render :edit }
        format.json { render json: @offer_blackboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offer_blackboards/1
  # DELETE /offer_blackboards/1.json
  def destroy
    @offer_blackboard.destroy
    respond_to do |format|
      format.html { redirect_to offer_blackboards_url, notice: 'Offer blackboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer_blackboard
      @offer_blackboard = OfferBlackboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_blackboard_params
      params.require(:offer_blackboard).permit(:title, :description, :totalPrice, :image_id, :street, :city, :zipcode, :user_id, :category_id, :condition)
    end
end
