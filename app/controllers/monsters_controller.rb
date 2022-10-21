class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    monster
  end

  def edit
    monster
  end

  def new
    @monster = Monster.new()
  end


  def create
    @monster = Monster.new(monsters_params)
    if @monster.save
      redirect_to edit_monster_path(@monster), notice: "Monstruo creado"
    end
  end

  def update
    monster
    if monster.update(monsters_params)
      redirect_to monsters_path, notice: "Monstruo editado"
    end
  end

  private
    # Defino strong params
    # solo se permite usar los parametros aqui definidos
    def monsters_params
      params.require(:monster).permit(:name, :description, :phone, :birthdate)
    end

    def monster
      # Si esta seteado no hace nada, sino lo va a buscar
      @monster ||= Monster.find(params[:id])
    end
end

