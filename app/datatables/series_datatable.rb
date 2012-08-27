# -*- coding: utf-8 -*-
class SeriesDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Series.count,
      iTotalDisplayRecords: series.total_entries,
      aaData: data
    }
  end

  private

  def data
    series.map do |serie|
      [
        h(serie.nombre),
        [
          link_to('Mostrar', serie, :class => 'btn'), 
          link_to('Editar', @view.edit_series_path(serie), :class => 'btn'), 
          link_to('Eliminar', serie, confirm: '¿Esta seguro?', method: :delete, :class => 'btn btn-danger')
        ]
      ]
    end
  end

  def series
    @series ||= fetch_series
  end

  def fetch_series
    series = Series.order("#{sort_column} #{sort_direction}")
    series = series.page(page).per_page(per_page)
    if params[:sSearch].present?
      series = series.where("nombre like :search", search: "%#{params[:sSearch]}%")
    end
    series
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[nombre]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
