class ComunidadesController < ApplicationController
  respond_to :json

  def index
    if params[:municipio_id]
      @comunidades = Comunidad.where(:MunCod => params[:municipio_id]).includes(:departamento, :municipio).order(:LugPobDes)
    elsif params[:departamento_id]
      @comunidades = Comunidad.where(:DepCod => @departamento.id).include(:departamento, :municipio).order(:MunCod, :LugPobDes)
    else
      @comunidades = Comunidad.order(:DepCod, :MunCod, :LugPobDes)
    end
  
    respond_to do |format|
      format.json { render json: @comunidades}
    end
  end

  def show
    @comunidad = Comunidad.find(params[:id])
    respond_to do |format|
      format.json { render json: @comunidad}
    end
  end
end
