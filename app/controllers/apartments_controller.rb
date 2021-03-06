class ApartmentsController < ApplicationController
  #Filtert ob Benutzer angemeldet ist, außer show und index, diese wird immer angezeigt
  before_filter :authenticate_user!, :except => [:show, :index]
  #Nur eigene Eintraege duerfen Editiert und gelöscht werden
  before_action :authorize, :only => [:edit, :destroy]
  before_action :set_apartment, only: [:show, :edit, :update, :destroy, :choose]
  
  def authorize
    @apartment = Apartment.find(params[:id])
    unless @apartment.user_id == current_user.id
      flash[:notice] = "Sie sind nicht Berechtigt diesen Eintrag zu ändern!!"
      redirect_to apartment_path # or anything you prefer
      return false # Important to let rails know that the controller should not be executed
    end
  end

  # GET /apartments
  # GET /apartments.json
  def index
    if params[:search]
      @apartments = Apartment.search(params[:search], params[:phase], params[:apartment_type], params[:request])
    else
      @apartments = Apartment.all
    end
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new_offer
    @apartment = Apartment.new
  end

  def new_request
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user_id = current_user.id

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:title, :description, :totalPrize, :street, :city, :zipcode, :user_id, :size, :rent, :additionalCost, :phase, :deposit, :apartment_type, :movein, :furnished, :internet, :parking, :rooms, :phone,:smoking, :request, images_attributes: [:id, :title, :photo, :apartment_id, :_destroy])
    end
end
