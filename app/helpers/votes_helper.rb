module VotesHelper
  def vote_button_class(user, review, vote_status)
    class_string = "#{vote_status}vote-button"

    status = user.check_vote_status_of(review)

    if status == vote_status
      if status == 'up'
        class_string << ' green'
      else
        class_string << ' red'
      end
    end

    class_string
  end
end
