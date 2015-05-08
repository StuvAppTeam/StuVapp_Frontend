# Controller für das dhbw_news Model
# Benötigt für den Abruf der Daten aus der App heraus (REST-API)
# Keine zusätzlichen Methoden eingefügt
class DhbwNewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :admin, :except => [:index]


  # GET /dhbw_news
  # GET /dhbw_news.json
  def index
    @dhbw_news = DhbwNews.all
  end

  # GET /dhbw_news/1
  # GET /dhbw_news/1.json
  def show
  end

  # GET /dhbw_news/new
  def new
    @dhbw_news = DhbwNews.new
  end

  # GET /dhbw_news/1/edit
  def edit
  end

  # POST /dhbw_news
  # POST /dhbw_news.json
  def create
    @dhbw_news = DhbwNews.new(dhbw_news_params)

    respond_to do |format|
      if @dhbw_news.save
        format.html { redirect_to @dhbw_news, notice: 'Dhbw news was successfully created.' }
        format.json { render :show, status: :created, location: @dhbw_news }
      else
        format.html { render :new }
        format.json { render json: @dhbw_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dhbw_news/1
  # PATCH/PUT /dhbw_news/1.json
  def update
    respond_to do |format|
      if @dhbw_news.update(dhbw_news_params)
        format.html { redirect_to @dhbw_news, notice: 'Dhbw news was successfully updated.' }
        format.json { render :show, status: :ok, location: @dhbw_news }
      else
        format.html { render :edit }
        format.json { render json: @dhbw_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dhbw_news/1
  # DELETE /dhbw_news/1.json
  def destroy
    @dhbw_news.destroy
    respond_to do |format|
      format.html { redirect_to dhbw_news_index_url, notice: 'Dhbw news was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dhbw_news
      @dhbw_news = DhbwNews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dhbw_news_params
      params.require(:dhbw_news).permit(:feedId, :message, :picture, :link, :feedDate)
    end
end
