# -*- coding: utf-8 -*-
class Escuela < ActiveRecord::Base
  self.table_name = 'ESCUELA'
  self.primary_key = 'Esc_UDI'
  
  alias_attribute :id, :Esc_UDI
  alias_attribute :departamento_id, :DEPCODMIN
  alias_attribute :departamento_nombe, "Nombre del Departamento"
  alias_attribute :municipio_id, :MUNCODMIN
  alias_attribute :municipio_nombre, "Nombre del Municipio"
  alias_attribute :nombre, :Esc_Nombre
  alias_attribute :direccion, :Esc_Direccion
  alias_attribute :telefono, "Teléfono"
  alias_attribute :nivel, "Nivel Educativo"
  alias_attribute :jornada, "Jornada escolar"
  alias_attribute :sector, :Sector
  alias_attribute :status, :Status

  belongs_to :departamento, foreign_key: "DEPCODMIN"
  belongs_to :municipio, foreign_key: "MUNCODMIN"
  
  has_many :asistencias, foreign_key: "Cod_UDI"

  has_many :estudiantes, -> { distinct }, through: :asistencias
  
  def grados
    self.asistencias.select(:Grado).distinct.order(:Grado).pluck :Grado
  end
  
end

# == Schema Information
#
# Table name: ESCUELA
#
#  DEPCODMIN               :integer
#  Nombre del Departamento :string(150)
#  MUNCODMIN               :integer
#  Nombre del Municipio    :string(150)
#  Esc_UDI                 :string(150)      not null, primary key
#  Esc_Nombre              :string(150)
#  Esc_Direccion           :string(150)
#  Teléfono                :string(150)
#  Nivel Educativo         :string(150)
#  Jornada escolar         :string(150)
#  Sector                  :string(150)
#  Status                  :string(150)
#

