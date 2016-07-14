import React, { Component } from 'react';

class VoteButtons extends Component {
  constructor(props) {
    super(props);

    this.state = {
      vote: {}
    }
  }

  render() {
    let review_vote = `/api/reviews/${vote.review_id}/votes`
    let authenticity_token = $('#authenticity_token').val();

    if(this.props.currentUser){
      return (
        <div className="votes columns small-1 medium-1">
          <div className="upvote">
            <form action={review_vote} accept-charset="UTF-8" method="post">
              <input name="utf8" type="hidden" value="✓">
              <input type="hidden"
                     name="authenticity_token"
                     value={authenticity_token} />

              <button type="submit" className="upvote-button XXXX" onClick={}>
                <i className="fa fa-chevron-up"></i>
              </button>
            </form>
          </div>
          <div className="downvote">
            <form action={review_vote} accept-charset="UTF-8" method="post">
              <input name="utf8" type="hidden" value="✓">
              <input type="hidden"
                     name="authenticity_token"
                     value={authenticity_token} />

              <button type="submit" className="downvote-button" onClick={}>
                <i className="fa fa-chevron-down"></i>
              </button>
            </form>
          </div>
        </div>
      );
    } else {
      return ();
    }
  }

}

export default VoteButtons;
