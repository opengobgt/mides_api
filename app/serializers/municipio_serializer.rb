class MunicipioSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :url, :departamento_url, :comunidades_url, :escuelas_url

  has_one :departamento
  has_many :comunidades
  has_many :escuelas


  def url
    departamento_municipio_url(object.departamento_id, object.id)
  end

  def departamento_url
    scope.request.protocol + \
    scope.request.host + \
    (scope.request.port.to_s rescue '') + \
    departamento_path(object.departamento_id)
  end

  def comunidades_url
    departamento_municipio_comunidades_url(object.departamento_id, object.id)
  end

  def escuelas_url
    departamento_municipio_escuelas_url(object.departamento_id, object.id)
  end

  def include_departamento?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('departamento')
    end
  end


  def include_comunidades?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('comunidades')
    end
  end

  def include_escuelas?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('escuelas')
    end
  end

end
