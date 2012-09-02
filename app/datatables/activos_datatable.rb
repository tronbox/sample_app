# -*- coding: utf-8 -*-
class ActivosDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Activo.count,
      iTotalDisplayRecords: activos.total_entries,
      aaData: data
    }
  end

  private

  def data
    if params[:origen].present? and params[:origen] == "orden_servicio"
      activos.map do |activo|
        [
          h(activo.id),
          h(activo.clave),
          h(activo.descripcion),
          h(activo.area.descripcion),
          link_to('Seleccionar', "#", :class => 'btn btn-mini btn-inverse selecciona_activo')
        ]
      end
    else
      activos.map do |activo|
        [
          h(activo.clave),
          h(activo.descripcion),
          h(activo.costo_revision),
          h(activo.area.descripcion),
          [
            link_to('Mostrar', activo, :class => 'btn'), 
            link_to('Editar', @view.edit_activo_path(activo), :class => 'btn'), 
            link_to('Eliminar', activo, confirm: '¿Esta seguro?', method: :delete, :class => 'btn btn-danger')
          ]
        ]
      end
    end
  end

  def activos
    @activos ||= fetch_activos
  end

  def fetch_activos
    activos = Activo.order("#{sort_column} #{sort_direction}")
    activos = activos.page(page).per_page(per_page)
    if params[:sSearch].present?
      activos = activos.where("clave like :search or descripcion like :search", search: "%#{params[:sSearch]}%")
    end
    activos
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[clave descripcion costo_revision]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
