import React, { Component } from 'react';
import VoteButtons from './VoteButtons';

class ReviewListItem extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let review = this.props.review;

    let edit_venue_review_path = `/venues/${review.venue_id}/reviews/${review.id}/edit`
    let review_path = `/reviews/${review.id}`
    let authenticity_token = $('#authenticity_token').val();

    let modifyButtons = null;
    if(this.props.currentUser) {
      modifyButtons = (
        <ul className="button-group">
          <li>
            <a href={edit_venue_review_path}
               className="button tertiery fixed-width-button">
                Edit
            </a>
          </li>
          <li>
            <form className="button_to" method="post" action={review_path}>
              <input type="hidden" name="_method" value="delete" />
              <input className="button tertiery fixed-width-button"
                     type="submit"
                     value="Delete" />
              <input type="hidden"
                     name="authenticity_token"
                     value={authenticity_token} />
            </form>
          </li>
        </ul>
      );
    }

    return (
      <div className="row review">
        <div className="columns small-12 medium-12">
          <div className="row">
            <VoteButtons currentUser={this.props.currentUser}
                         reviewId={review.id} />
            <div className="rating columns small-1 medium-1">
              <h3>{review.rating}</h3>
            </div>
            <div className="rating-body columns small-6 medium-7">
              <p>{review.body}</p>
            </div>
            <div className="buttons columns small-3 medium-2">
              {modifyButtons}
            </div>
          </div>
        </div>
      </div>
    );
  }

}

export default ReviewListItem;
