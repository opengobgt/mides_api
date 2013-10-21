class FamiliasController < ApplicationController
  respond_to :json

  def index
    if params[:estudiante_id]
      estudiante = Miembro.find(params[:estudiante_id])
      @familias = estudiante.familia
    elsif params[:comunidad_id]
      @familias = Familia.where(LugPobCod: params[:comunidad_id])
    elsif params[:municipio_id]
      @familias = Familia.where(MunCod: params[:municipio_id])
    elsif params[:departamento_id]
      @familias = Familia.where(DepCod: params[:departamento_id])
    end


    respond_to do |format|
      format.json { render json: @familia, each_serializer: FamiliaSerializer}
    end
  end

  def show
    if params[:estudiante_id]
      @familia = Miembro.find(params[:estudiante_id]).familia
    else
      @familia = Familia.find(params[:id])
    end
    respond_to do |format|
      format.json { render json: @familia, serializer: FamiliaSerializer }
    end
  end

end
