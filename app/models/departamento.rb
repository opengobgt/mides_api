class Departamento < ActiveRecord::Base
  self.table_name = 'PRM_DEPARTAMENTO'
  self.primary_key = 'DepCod'

  alias_attribute :id, :DepCod
  alias_attribute :codigo, :RegCod
  alias_attribute :nombre, :DepDes
  alias_attribute :estado, :DepEst # a saber

  has_many :municipios, foreign_key: "DepCod"
  has_many :comunidades, foreign_key: "DepCod"

end

# == Schema Information
#
# Table name: PRM_DEPARTAMENTO
#
#  DepCod :integer          not null, primary key
#  RegCod :integer          not null
#  DepDes :string(50)       not null
#  DepEst :string(1)        not null
#

