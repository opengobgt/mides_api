class Comunidad < ActiveRecord::Base
  self.table_name = 'PRM_LUGARPOBLADO'
  self.primary_key = 'LugPobCod'

  alias_attribute :id,              :LugPobCod
  alias_attribute :departamento_id, :DepCod
  alias_attribute :municipio_id,    :MunCod
  alias_attribute :nombre,          :LugPobDes
  alias_attribute :estado,          :LugPobEst # a saber

  belongs_to :departamento, foreign_key: "DepCod"
  belongs_to :municipio, foreign_key: "MunCod"

end

# == Schema Information
#
# Table name: PRM_LUGARPOBLADO
#
#  DepCod    :integer          not null
#  MunCod    :integer          not null
#  LugPobCod :integer          not null, primary key
#  LugPobDes :string(50)       not null
#  LugPobEst :string(1)        not null
#

