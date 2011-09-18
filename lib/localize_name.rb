module LocalizeName

  def name
    send "name_#{I18n.locale.to_sym}".to_sym
  end

end
