class Comunidad < ActiveRecord::Base
  self.table_name = 'PRM_LUGARPOBLADO'
  self.primary_key = 'LugPobCod'

  alias_attribute :id,              :LugPobCod
  alias_attribute :departamento_id, :DepCod
  alias_attribute :municipio_id,    :MunCod
  alias_attribute :nombre,          :LugPobDes
  alias_attribute :estado,          :LugPobEst # a saber

end
