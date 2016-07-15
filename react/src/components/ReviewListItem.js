import React, { Component } from 'react';
import VoteButtons from './VoteButtons';

class ReviewListItem extends Component {
  constructor(props) {
    super(props);

    this.deleteReview = this.deleteReview.bind(this);
  }

  deleteReview() {
    this.props.onDelete(this.props.review);
  }

  render() {
    let review = this.props.review;

    let edit_venue_review_path = `/reviews/${review.id}/edit`
    let review_path = `/reviews/${review.id}`
    let authenticity_token = $('#authenticity_token').val();

    let modifyButtons = null;
    let currentUser = this.props.currentUser;

    if(currentUser &&
        (currentUser == 'admin' || currentUser == review.user_id)) {
      modifyButtons = (
        <ul className="button-group">
          <li>
            <a href={edit_venue_review_path}
               className="button tertiery fixed-width-button">
                Edit
            </a>
          </li>
          <li>
            <button className="button tertiery fixed-width-button"
                    type="submit"
                    onClick={this.deleteReview} >
              Delete
            </button>
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
