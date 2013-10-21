class EscuelaSerializer < ActiveModel::Serializer
  include SerializerHelpers 

  attributes :id, :nombre, :direccion, :telefono, :nivel, :jornada, \
  :sector, :status, :url, :departamento_url, :municipio_url, :estudiantes_url

  has_one :departamento
  has_one :municipio
  has_many :estudiantes, serializer: EstudianteSerializer


  def include_estudiantes?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('estudiantes')
    end
  end

  def url
    scope.request.protocol + \
    scope.request.host + \
    (':' + scope.request.port.to_s rescue '') + \
    escuela_path(object.id)
  end

  def estudiantes_url
    escuela_estudiantes_url(object.id)
  end


end
