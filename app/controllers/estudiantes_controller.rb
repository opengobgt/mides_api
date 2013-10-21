class EstudiantesController < ApplicationController
  respond_to :json

  def index
    escuela = Escuela.find(params[:escuela_id])
    @estudiantes = escuela.estudiantes.order(:MieApe1, :MieApe2, :MieNom1, :MieNom2)
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
