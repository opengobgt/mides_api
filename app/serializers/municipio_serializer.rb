class MunicipioSerializer < ActiveModel::Serializer  
  include SerializerHelpers 

  attributes :id, :nombre, :url, :departamento_url, :comunidades_url, :escuelas_url

  has_one :departamento
  has_many :comunidades
  has_many :escuelas

  def include_comunidades?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('comunidades')
    end
  end

  def url
    departamento_municipio_url(object.departamento_id, object.id)
  end

  def comunidades_url
    departamento_municipio_comunidades_url(object.departamento_id, object.id)
  end

  def escuelas_url
    departamento_municipio_escuelas_url(object.departamento_id, object.id)
  end



end
