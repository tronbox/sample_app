# -*- coding: utf-8 -*-
class UsuariosDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Series.count,
      iTotalDisplayRecords: usuarios.total_entries,
      aaData: data
    }
  end

  private

  def data
    usuarios.map do |usuario|
      [
        h(usuario.email),
        h(usuario.rol.nombre.capitalize),
        
        [
          link_to('Mostrar', usuario, :class => 'btn'), 
          link_to('Editar', @view.edit_user_path(usuario), :class => 'btn'), 
          link_to('Eliminar', usuario, confirm: '¿Esta seguro?', method: :delete, :class => 'btn btn-danger')
        ]
      ]
    end
  end

  def usuarios
    @usuarios ||= fetch_usuarios
  end

  def fetch_usuarios
    usuarios = User.order("#{sort_column} #{sort_direction}")
    usuarios = usuarios.page(page).per_page(per_page)
    if params[:sSearch].present?
      usuarios = usuarios.where("email like :search or rol like :search", search: "%#{params[:sSearch]}%")
    end
    usuarios
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[email rol.nombre]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
