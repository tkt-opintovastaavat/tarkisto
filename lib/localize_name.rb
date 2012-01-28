module LocalizeName

  def name
    send :"name_#{I18n.locale}"
  end

end
