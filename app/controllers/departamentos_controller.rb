class DepartamentosController < ApplicationController
  respond_to :json

  def index
    @departamentos = Departamento.all
    respond_to do |format|
      format.json { render json: @departamentos}
    end
  end
end
