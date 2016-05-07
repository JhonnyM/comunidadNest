module ProfesionalesHelper
  def professionales_pais_filter_values
    values = Profesional.pluck(:pais).uniq! {|pais| [ pais, pais ] },

    # This can be removed in future when site will be up and running. This is
    # only needed for development because development db sometimes has
    # no empresa records at all.
    values.present? ? values : [nil]
  end

  def format_nil_values value
    value.blank? ? "N/A" : value
  end

  def formar_gender gender
    gender == 0 ? "Masculino" : "Femenino"
  end
end
