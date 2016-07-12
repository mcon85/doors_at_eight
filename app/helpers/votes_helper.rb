module VotesHelper
  def vote_button_class(user, review, vote_status)
    class_string = "#{vote_status}vote-button"

    status = user.check_vote_status_of(review)

    if status == 'up'
      class_string << ' green'
    elsif status == 'down'
      class_string << ' red'
    end

    class_string
  end
end
