class EstadisticasController < ApplicationController
  respond_to :json

  def show
    @stats = []
    
    if params[:departamento_id]
      departamento = Departamento.includes(:escuelas, :estudiantes).find(params[:departamento_id])
      @stats << depto_stats(departamento)
    else
      Departamento.includes(:escuelas, :estudiantes).find_each do |departamento|
	@stats << depto_stats(departamento)
      end
    end
    respond_to do |format|
      format.json { render json: @stats }
    end
  end
  
  def depto_stats departamento
    {}.tap do |stats|
      stats[:departamento] = departamento
      stats[:totales] = {}
      stats[:totales][:escuelas] = departamento.escuelas.count
      stats[:totales][:estudiantes] = departamento.estudiantes.count
      stats[:totales][:familias] = departamento.familias.count
    end
  end
end
