class Usuario < ActiveRecord::Base
  self.table_name = "USUARIO"
  self.primary_key = "UsuCod"
  
  alias_attribute :id, :UsuCod
  alias_attribute :codigo, :UsuID
  alias_attribute :nombre, :UsuNom
  alias_attribute :password, :UsuPas
  alias_attribute :departamento_id, :DepCod
  alias_attribute :municipio_id, :MunCod
  alias_attribute :estado, :Estado
  alias_attribute :usuario_id, :Usu_creador

  belongs_to :departamento, foreign_key: "DepCod"
  belongs_to :municipio, foreign_key: "MunCod"
  has_many :asistencias, foreign_key: "Usuario"

  has_many :escuelas, through: :asistencias

  def escuelas
    escuelas = self.asistencias.select("Cod_UDI").distinct.map { |e| e.escuela_id }
    Escuela.where(Esc_UDI: escuelas)
  end
  
  def self.find_by_email email
    self.where(UsuNom: email)
  end

  def self.authenticate code, password
    self.where(UsuNom: code).where(UsuPas: password).any?
  end
end

# == Schema Information
#
# Table name: USUARIO
#
#  UsuCod      :integer          not null, primary key
#  UsuID       :string(12)       not null
#  UsuNom      :string(100)      not null
#  UsuPas      :string(20)       not null
#  DepCod      :integer
#  MunCod      :integer
#  Estado      :boolean
#  Usu_creador :integer
#

