class MunicipiosController < ApplicationController
  respond_to :json

  def index
    if params[:departamento_id]
      @municipios = Departamento.find(params[:departamento_id]).municipios
    else
      @municipios = Municipio.all      
    end

    respond_to do |format|
      format.json { render json: @municipios}
    end
  end

  def show
    @municipio = Municipio.find(params[:id])
    respond_to do |format|
      format.json { render json: @municipio}
    end
  end
end
