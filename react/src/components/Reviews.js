import React, { Component } from 'react';
import ReviewListItem from './ReviewListItem';

class Reviews extends Component {
  constructor(props) {
    super(props);

    this.state = {
      reviews: []
    }

    this.getReviews = this.getReviews.bind(this);
    this.populateReviews = this.populateReviews.bind(this);
    this.venueId = this.venueId.bind(this);
    this.currentUser = this.currentUser.bind(this);
    this.formatReviews = this.formatReviews.bind(this);
  }

  componentDidMount() {
    this.getReviews();
  }

  getReviews() {
    $.ajax({
      url: `/api/venues/${this.venueId()}/reviews`,
      method: 'GET',
      success: this.populateReviews
    });
  }

  populateReviews(data) {
    this.setState({ reviews: data.reviews });
  }

  formatReviews() {
    return this.state.reviews.map(review => {
      return (
        <ReviewListItem key={review.id}
                        review={review}
                        currentUser={this.currentUser()} />
      );
    });
  }

  venueId() {
    return $('#venue_id').val();
  }

  currentUser() {
    return $('#current_user').val();
  }

  render() {
    let new_review_path = `/venues/${this.venueId()}/reviews/new`

    return (
      <div>
        <div className="heading">
          <h1>Reviews</h1>
          <a href={new_review_path}>Add A Review</a>
        </div>
        <div className="reviews">
          { this.formatReviews() }
        </div>
      </div>
    );
  }
}

export default Reviews;
