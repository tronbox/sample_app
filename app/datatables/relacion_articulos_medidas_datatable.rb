# -*- coding: utf-8 -*-
class RelacionArticulosMedidasDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: RelacionArticuloMedida.count,
      iTotalDisplayRecords: relacion_articulos_medidas.total_entries,
      aaData: data
    }
  end

  private

  def data
    if params[:origen].present? and params[:origen] == "orden_servicio"
      relacion_articulos_medidass.map do |relacion_articulos_medidas|
        [
          h(relacion_articulos_medidas.id),
          h(relacion_articulos_medidas.articulo.descripcion),
          h(relacion_articulos_medidas.medida.descripcion),
          h(relacion_articulos_medidas.unidades_por_empaque),
          link_to('Seleccionar', "#", :class => 'btn btn-mini btn-inverse selecciona_relacion_articulos_medidas')
        ]
      end
    else
      relacion_articulos_medidass.map do |relacion_articulos_medidas|
        [
          h(relacion_articulos_medidas.clave),
          h(relacion_articulos_medidas.articulo.descripcion),
          h(relacion_articulos_medidas.medida.descripcion),
          h(relacion_articulos_medidas.unidades_por_empaque),
          [
            link_to('Mostrar', relacion_articulos_medidas, :class => 'btn'), 
            link_to('Editar', @view.edit_relacion_articulos_medidas_path(relacion_articulos_medidas), :class => 'btn'), 
            link_to('Eliminar', relacion_articulos_medidas, confirm: '¿Esta seguro?', method: :delete, :class => 'btn btn-danger')
          ]
        ]
      end
    end
  end

  def relacion_articulos_medidass
    @relacion_articulos_medidass ||= fetch_relacion_articulos_medidas
  end

  def fetch_relacion_articulos_medidas
    relacion_articulos_medidass = RelacionArticuloMedida.order("#{sort_column} #{sort_direction}")
    relacion_articulos_medidass = relacion_articulos_medidass.page(page).per_page(per_page)
    if params[:sSearch].present?
      relacion_articulos_medidass = relacion_articulos_medidass.where("articulo.descripcion like :search or medida.descripcion like :search", search: "%#{params[:sSearch]}%")
    end
    relacion_articulos_medidass
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[clave articulo.descripcion medida.descripcion]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
