class AsistenciasController < ApplicationController
  respond_to :json

  def index
    estudiante = Miembro.find(params[:estudiante_id])
    @asistencias = estudiante.asistencias.order(:Fecha_Llenado => :desc)
    respond_to do |format|
      format.json { render json: @asistencias }
    end
  end

end
