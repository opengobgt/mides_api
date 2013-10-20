class DepartamentoSerializer < ActiveModel::Serializer
  delegate :params, to: :scope

  attributes :id, :nombre, :url, :municipios_url, :escuelas_url

  has_many :municipios
  has_many :escuelas

  def include_municipios?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('municipios')
    end
  end

  def include_escuelas?
    if scope.params[:embed]
      embed = scope.params[:embed].split(',') 
      return true if embed.include?('escuelas')
    end
  end

  def url
    departamento_url(object)
  end

  def municipios_url
    departamento_municipios_url(object)
  end

  def escuelas_url
    departamento_escuelas_url(object)
  end


end
