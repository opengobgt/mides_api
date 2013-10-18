class DepartamentoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :municipios

  def municipios
    departamento_municipios_url(object)
  end
end
