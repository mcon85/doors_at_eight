import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import RecentReviews from './components/RecentReviews.js';
import Reviews from './components/Reviews.js';

$(function() {
  let recentReviewsElement = document.getElementById('review-carousel')
  if(recentReviewsElement){
    ReactDOM.render(
      <RecentReviews />,
      recentReviewsElement
    );
  }

  let reviewsElement = document.getElementById('react-reviews');
  if(reviewsElement){
    ReactDOM.render(
      <Reviews />,
      reviewsElement
    );
  }
});
