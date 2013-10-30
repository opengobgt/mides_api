class EstadisticasEstudianteController < ApplicationController
  respond_to :json

  def show
    @stats = []
    estudiante = Miembro.find(params[:id])
    @stats << estudiante_stats(estudiante)
    respond_to do |format|
      format.json { render json: @stats }
    end
  end
  
  def estudiante_stats estudiante

    {}.tap do |stats|
      stats[:estudiante] = estudiante
      stats[:totales] = {}
      stats[:totales][:ciclo] = {}
      stats[:totales][:escuela] = {}
      stats[:totales][:estudiante] = {}

      stats[:totales][:ciclo][:ano] = Date.today.year

      inicio = Date.parse('2013-01-15')
      hoy = Date.today
      dias_habiles = inicio.business_days_until(hoy)
      stats[:totales][:ciclo][:dias_habiles] = dias_habiles

      primera_asistencia = estudiante.asistencias.first.fecha.to_date
      stats[:totales][:estudiante][:primera_asistencia] = primera_asistencia

      dias_asistencia = estudiante.asistencias.count
      stats[:totales][:estudiante][:dias_asistencia] = dias_asistencia

      dias_habiles = primera_asistencia.business_days_until(hoy)
      stats[:totales][:estudiante][:dias_habiles] = dias_habiles

      porcentaje_asistencia = ((dias_asistencia * 100)/dias_habiles)
      stats[:totales][:estudiante][:porcentaje_asistencia] = porcentaje_asistencia

      stats[:totales][:escuela] = {}
      stats[:totales][:estudiantes] = {}
      stats[:totales][:familias] = {}
    end
  end
end
