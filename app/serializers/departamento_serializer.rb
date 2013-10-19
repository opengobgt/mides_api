class DepartamentoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :url, :municipios, :escuelas

  def url
    departamento_url(object)
  end

  def municipios
    departamento_municipios_url(object)
  end

  def escuelas
    departamento_escuelas_url(object)
  end

end
