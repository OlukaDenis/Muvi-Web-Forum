module ApplicationHelper
   # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Muvi: The Movie Guide"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def question_date(question)
    question.created_at.strftime('%b %d, %Y at %I:%M %p')
  end

  def answer_date(answer)
    "#{time_ago_in_words(answer.created_at)} ago"
  end
end
