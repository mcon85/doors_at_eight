import React, { Component } from 'react';
import ReviewListItem from './ReviewListItem';
import ReactCSSTransitionGroup from 'react/lib/ReactCSSTransitionGroup';

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
    this.onDeleteReview = this.onDeleteReview.bind(this);
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

  onDeleteReview(deletedReview) {
    $.ajax({
      url: `/api/reviews/${deletedReview.id}`,
      method: 'DELETE'
    })
    .success((data) => {
      let reviews = this.state.reviews;

      reviews = reviews.filter((review) => {
        return review.id != deletedReview.id;
      });

      this.setState({ reviews: reviews });
    });
  }

  formatReviews() {
    return this.state.reviews.map(review => {
      return (
        <ReviewListItem key={review.id}
                        review={review}
                        currentUser={this.currentUser()}
                        onDelete={this.onDeleteReview} />
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
          <ReactCSSTransitionGroup transitionName="review"
                                   transitionEnterTimeout={500}
                                   transitionLeaveTimeout={300}
                                   transitionAppear={true}
                                   transitionAppearTimeout={500}>
          { this.formatReviews() }
        </ReactCSSTransitionGroup>
        </div>
      </div>
    );
  }
}

export default Reviews;
