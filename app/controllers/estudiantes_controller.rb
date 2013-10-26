class EstudiantesController < ApplicationController
  respond_to :json

  after_filter :only => [:index] {set_pagination(:estudiantes)}

  def index
    if params[:escuela_id]
      scope = Escuela.find(params[:escuela_id])
	.estudiantes.order(:MieApe1, :MieApe2, :MieNom1, :MieNom2)
      scope = scope.where(Asistencia.table_name + '.Grado = ?', params[:grado].to_i) if params[:grado]
      @estudiantes = scope.page(params[:page]).per(params[:per_page])
    elsif params[:familia_id]
      familia = Familia.find(params[:familia_id])
      @estudiantes = familia.miembros.order(:MieApe1, :MieApe2, :MieNom1, :MieNom2).page(params[:page]).per(params[:per_page])
    else
      @estudiantes = Miembro.order(:MieApe1, :MieApe2, :MieNom1, :MieNom2).page(params[:page]).per(params[:per_page])
    end
    
    respond_to do |format|
      format.json { render json: @estudiantes, each_serializer: EstudianteSerializer}
    end
  end

  def show
    @estudiante = Miembro.find(params[:id])
    respond_to do |format|
      format.json { render json: @estudiante, serializer: EstudianteSerializer }
    end
  end

end
