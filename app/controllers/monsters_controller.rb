class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def new
    @monster = Monster.new()
  end


  private
    # Defino strong params
    # solo se permite usar los parametros aqui definidos
    def monsters_params
      params.require(:monster).permit(:name, :description, :phone, :birthdate)
    end
end

