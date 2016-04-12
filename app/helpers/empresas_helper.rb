module EmpresasHelper
  def empresas_pais_filter_values
    values = Empresa.pluck(:pais).uniq! { |pais| [ pais, pais ] }

    # This can be removed in future when site will be up and running. This is
    # only needed for development because development db sometimes has
    # no empresa records at all.
    values.present? ? values : [nil]
  end
end
