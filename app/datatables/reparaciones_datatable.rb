# -*- coding: utf-8 -*-
class ReparacionesDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Activo.count,
      iTotalDisplayRecords: reparaciones.total_entries,
      aaData: data
    }
  end

  private

  def data
    if params[:origen].present? and params[:origen] == "orden_servicio"
      reparaciones.map do |reparacion|
        [
          h(reparacion.id),
          h(reparacion.clave),
          h(reparacion.descripcion),
          h(reparacion.pasos),
          link_to('Seleccionar', "#", :class => 'btn btn-mini btn-inverse selecciona_reparacion')
        ]
      end
    else
      reparaciones.map do |reparacion|
        [
          h(reparacion.clave),
          h(reparacion.descripcion),
          h(reparacion.pasos),
          [
            link_to('Mostrar', reparacion, :class => 'btn'), 
            link_to('Editar', @view.edit_reparacion_path(reparacion), :class => 'btn'), 
            link_to('Eliminar', reparacion, confirm: '¿Esta seguro?', method: :delete, :class => 'btn btn-danger')
          ]
        ]
      end
    end
  end

  def reparaciones
    @reparaciones ||= fetch_reparaciones
  end

  def fetch_reparaciones
    reparaciones = Reparacion.order("#{sort_column} #{sort_direction}")
    reparaciones = reparaciones.page(page).per_page(per_page)
    if params[:sSearch].present?
      reparaciones = reparaciones.where("clave like :search or descripcion like :search or pasos like :search", search: "%#{params[:sSearch]}%")
    end
    reparaciones
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[clave descripcion pasos]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
