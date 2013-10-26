class EstadisticasController < ApplicationController
  respond_to :json

  def show
    @stats = {}
    if params[:departamento_id]
      departamento = Departamento.find params[:id]
      @stats[:departamento] = departamento
    end
    respond_to do |format|
      format.json { render json: @stats }
    end
  end

end
