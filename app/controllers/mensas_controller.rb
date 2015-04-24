class MensasController < ApplicationController
<<<<<<< HEAD
  def index 
    file = File.open("app/views/mensas/mensa.json")
  end
end
=======
  before_action :set_mensa, only: [:show, :edit, :update, :destroy]

  # GET /mensas
  # GET /mensas.json
  def index
    @mensas = Mensa.all
  end

  # GET /mensas/1
  # GET /mensas/1.json
  def show
  end

  # GET /mensas/new
  def new
    @mensa = Mensa.new
  end

  # GET /mensas/1/edit
  def edit
  end

  # POST /mensas
  # POST /mensas.json
  def create
    @mensa = Mensa.new(mensa_params)

    respond_to do |format|
      if @mensa.save
        format.html { redirect_to @mensa, notice: 'Mensa was successfully created.' }
        format.json { render :show, status: :created, location: @mensa }
      else
        format.html { render :new }
        format.json { render json: @mensa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensas/1
  # PATCH/PUT /mensas/1.json
  def update
    respond_to do |format|
      if @mensa.update(mensa_params)
        format.html { redirect_to @mensa, notice: 'Mensa was successfully updated.' }
        format.json { render :show, status: :ok, location: @mensa }
      else
        format.html { render :edit }
        format.json { render json: @mensa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensas/1
  # DELETE /mensas/1.json
  def destroy
    @mensa.destroy
    respond_to do |format|
      format.html { redirect_to mensas_url, notice: 'Mensa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensa
      @mensa = Mensa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensa_params
      params.require(:mensa).permit(:timestamp, :category, :title, :price)
    end
end
>>>>>>> Mensa_Plan
