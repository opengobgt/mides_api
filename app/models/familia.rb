class Familia < ActiveRecord::Base
  self.table_name = 'REG_FAMILIA'
  self.primary_key = 'HogCod'

  alias_attribute :id, :HogCod
  alias_attribute :departamento_id, :DepCod
  alias_attribute :municipio_id, :MunCod
  alias_attribute :comunidad_id, :LugPobCod
  alias_attribute :direccion, :HogDir
  alias_attribute :titular_id, :HogTitCod

  belongs_to :departamento, foreign_key: "DepCod"
  belongs_to :municipio, foreign_key: "MunCod"
  belongs_to :comunidad, foreign_key: "LugPobCod"

end

# == Schema Information
#
# Table name: REG_FAMILIA
#
#  HogCod    :string(15)       not null, primary key
#  DepCod    :integer          not null
#  MunCod    :integer          not null
#  LugPobCod :integer          not null
#  HogDir    :text
#  HogTitCod :integer
#

