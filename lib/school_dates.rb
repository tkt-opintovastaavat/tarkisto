module SchoolDates

  def self.semester

    month = Date.today.month
    if (1..5).include?(month)
      'K'
    elsif (6..8).include?(month)
      'V'
    else
      'S'
    end

  end

end
