class DepartamentosController < ApplicationController
  respond_to :json

  def index
    @departamentos = Departamento.all
    respond_to do |format|
      format.json { render json: @departamentos}
    end
  end

  def show
    @departamento = Departamento.find(params[:id])
    respond_to do |format|
      format.json { render json: @departamento}
    end
  end
end
