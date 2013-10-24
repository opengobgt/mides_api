class AsistenciasController < ApplicationController
  #http_basic_authenticate_with name: 'bono', password: 'PassPrueba', except: :index
  before_action :authenticate, only: :create
  respond_to :json

  def index
    estudiante = Miembro.find(params[:estudiante_id])
    @asistencias = estudiante.asistencias.order(:Fecha_Llenado => :desc)
    respond_to do |format|
      format.json { render json: @asistencias }
    end
  end
  
  def create
    estudiante = Miembro.find params[:estudiante_id]
    now = Time.now.strftime '%F %T'
    
    fields = {
	HogCod: estudiante.familia_id, 
	Miecod: estudiante.id,
	Cod_UDI: params[:escuela],
	Grado: params[:grado],
	Fecha_Llenado: now,
	Usuario: '1',
	Fecha_Digitacion: now,
	Anio: Date.today.year
    }
    
    @asistencia = Asistencia.create fields
    respond_to do |format|
      format.json { render json: @asistencia }
    end
  end
  
  private
  
  def authenticate
    if user = authenticate_with_http_basic{ |u, p| Usuario.authenticate u, p }
      @current_user = user
    else
      request_http_basic_authentication
      #respond_with nil, status: :unauthorized
    end
  end

end