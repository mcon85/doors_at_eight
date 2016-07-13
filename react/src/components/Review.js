import React from 'react';

const Review = props => {

  let venuePath = `/venues/${props.venueId}`

  return (
    <div className="row review">
      <div className="review-top columns">
        <div className="name columns">
          <h2><a href={venuePath}>{props.venueName}</a></h2>
        </div>
      </div>
      <div className="review-bottom">
        <div className="rating columns small-1">
          <h3>{props.rating}</h3>
        </div>
        <div className="rating-body columns small-11">
          <p>{props.body}</p>
        </div>
      </div>
    </div>
  );
};

export default Review;
