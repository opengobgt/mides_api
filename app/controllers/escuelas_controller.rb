class EscuelasController < ApplicationController
  respond_to :json

  def index
    if params[:municipio_id]
      @escuelas = Escuela.where(:MUNCODMIN => params[:municipio_id]).includes(:departamento, :municipio)
    elsif params[:departamento_id]
      @escuelas = Escuela.where(:DEPCODMIN => params[:departamento_id]).includes(:departamento, :municipio)
    else
      @escuelas = Escuela.all
    end

    respond_to do |format|
      format.json { render json: @escuelas}
    end
  end

  def show
    @escuela = Escuela.find(params[:id])
    respond_to do |format|
      format.json { render json: @escuela}
    end
  end
end
