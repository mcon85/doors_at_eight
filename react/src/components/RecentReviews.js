// jshint ignore: start
import React, { Component } from 'react';
import Review from './Review.js';

class RecentReviews extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
    this.populateReviews = this.populateReviews.bind(this);
    this.getReviews = this.getReviews.bind(this);
  };

  getReviews() {
    $.ajax({
      url: '/api/reviews',
      contentType: 'application/json'
    })
    .done(result => {
      this.setState({ reviews: result.reviews});
    });
  }

  componentDidMount() {
    this.getReviews();
  }

  populateReviews () {
    return this.state.reviews.map((review)=> {
      return (
        <Review
        rating={review.rating}
        body={review.body}
        venueName={review.venue_name}/>
      );
    });
  }

  render () {
    return(
      <div className="review-list row">
        <div className="columns small-12 medium-6 medium-centered">
          {this.populateReviews()}
        </div>
      </div>
    );
  }
}

export default RecentReviews;
