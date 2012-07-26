module ExamsHelper
  include DataObject

  def question_format question
    description = ""

    attachments = question.images + question.code_snippets


    filter = /<\[[ci]#[0-9]+\]>/
    attach = /<\[([ci])#([0-9]+)\]>/
    texts = question.description.split(filter)
    objects = question.description.scan(filter).map do |object|
      object = object.split(attach)
      if object[1] == 'i'
        question.images[object[2].to_i-1]
      else
        question.code_snippets[object[2].to_i-1]
      end
    end

    if texts.empty?
      texts << ""
    end
    texts.each do |str|
      description = description + str
      unless objects.empty?
        object = objects.shift
        if object.instance_of? Image
          description = description + "<img src='#{object.file.url(:web)}' />"
          attachments.delete object
        else
          description = description + "#{object.text}"
          attachments.delete object
        end
      end
    end

    attachments.each do |a|
      objects << a
    end

    objects.each do |object|
      if object.instance_of? Image
        description = description + "<img src='#{object.file.url(:web)}' /> <br />"
      else
        description = description + "#{object.text} <br />"
      end
    end
    return description
  end

  def format_points total_points, questions
    points_from_questions = questions.map(&:points).sum
    if total_points == points_from_questions
      total_points
    else
      "#{total_points} (#{pluralize(total_points - points_from_questions, 'piste', 'pistettä')} puuttuu)"
    end
  end

end
