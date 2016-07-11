import React from 'react';

const Review = props => {

  return (
    <div className="review">
      <div className="row">
        <div className="name columns">
          <h2>{props.venueName}</h2>
        </div>
      </div>
      <div className="row">
        <div className="rating columns small-2">
          <h3>{props.rating}</h3>
        </div>
        <div className="rating-body columns small-10">
          <p>{props.body}</p>
        </div>
      </div>
    </div>
  );
};

export default Review;
