class MensasController < ApplicationController
  def index 
    file = File.open("app/views/mensas/mensa.json")
  end
end