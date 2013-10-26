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

    # validar usuario
    usuario = Usuario.find(params[:usuario_id])    

    # validar escuela
    escuela = Escuela.find(params[:escuela_id])

    # obtener estudiantes
    estudiantes = Miembro.where(MieCod: params[:estudiantes_ids])

    # ingresar 

    now = Time.zone.now
    formated_now = now.strftime '%F %T %z'


    asistencias = []

    estudiantes.each do |estudiante|
      asistencia = {
        HogCod:           estudiante.familia_id, 
        Miecod:           estudiante.id,
        Cod_UDI:          escuela.id,
        Grado:            params[:grado],
        Fecha_Llenado:    formated_now,
        Usuario:          usuario.id,
        Fecha_Digitacion: formated_now,
        Anio:             now.year
      }

      asistencias << asistencia
    end
    
    @asistencias = Asistencia.create! asistencias
    render json: @asistencias, each_serializer: AsistenciaSerializer

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

  # def asistencias_parameters
  #   params.require(:asistencia).permit(:escuela_id, :usuario_id, :estudiantes_ids)
  # end

end
