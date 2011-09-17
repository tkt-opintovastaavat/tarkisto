module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the faq page/
      '/faq'

    when /the exams page of course ([0-9]+)/
      "/courses/#{Course.find_by_code($1).id}/exams"

    when /the new exam page of course ([0-9]+)/
      "/courses/#{Course.find_by_code($1).id}/exams/new"

    when /the generate practice exam page of course ([0-9]+)/
      "/courses/#{Course.find_by_code($1).id}/exams/generate"

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
           "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
