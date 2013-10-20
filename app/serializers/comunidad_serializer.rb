class ComunidadSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :url, :departamento_url, :municipio_url

  has_one :departamento
  has_one :municipio

  def url
    departamento_municipio_comunidad_url(object.departamento_id, object.municipio_id, object.id)
  end

  def departamento_url
    scope.request.protocol + \
    scope.request.host + \
    (scope.request.port.to_s rescue '') + \
    departamento_path(object.departamento_id)
  end

  def municipio_url
    departamento_municipio_url(object.departamento_id, object.municipio_id)
  end

  def include_departamento?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('departamento')
    end
  end


  def include_municipio?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('municipio')
    end
  end

end
