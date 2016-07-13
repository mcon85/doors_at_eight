// jshint ignore: start
import React, { Component } from 'react';
import Review from './Review.js';
import ReactCSSTransitionGroup from 'react/lib/ReactCSSTransitionGroup';

class RecentReviews extends Component {
  constructor(props) {
    super(props);

    this.pusherService = props.pusherService;

    this.state = {
      reviews: []
    }
    this.populateReviews = this.populateReviews.bind(this);
    this.getReviews = this.getReviews.bind(this);

    this.receiveNewReview = this.receiveNewReview.bind(this);
    this.pusherService.config(this.receiveNewReview);
  };

  getReviews() {
    console.log('getting reviews');
    $.ajax({
      url: '/api/reviews',
      contentType: 'application/json'
    })
    .done(result => {
      this.setState({ reviews: result.reviews });
    });
  }

  componentDidMount() {
    this.getReviews();
  }

  populateReviews() {
    return this.state.reviews.map((review)=> {
      return (
        <Review
        key={review.id}
        rating={review.rating}
        body={review.body}
        venueId={review.venue_id}
        venueName={review.venue_name}/>
      );
    });
  }

  receiveNewReview(data) {
    let currentReviews = this.state.reviews;

    currentReviews.unshift(data.review);

    if(currentReviews.length > 3){
      currentReviews.pop();
    }

    this.setState({ reviews: currentReviews });
  }

  render () {
    return(
      <div className="review-list row">
        <div className="columns small-12 medium-6 medium-centered">
          <ReactCSSTransitionGroup transitionName="review"
                                   transitionEnterTimeout={500}
                                   transitionLeaveTimeout={300}
                                   transitionAppear={true}
                                   transitionAppearTimeout={500}>
            {this.populateReviews()}
          </ReactCSSTransitionGroup>
        </div>
      </div>
    );
  }
}

export default RecentReviews;
