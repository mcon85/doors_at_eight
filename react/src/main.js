import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import RecentReviews from './components/RecentReviews.js';

$(function() {
  let recentReviewsElement = document.getElementById('review-carousel')
  if(recentReviewsElement){
    ReactDOM.render(
      <RecentReviews />,
      recentReviewsElement
    );
  }
});
