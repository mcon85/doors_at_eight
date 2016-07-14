import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import RecentReviews from './components/RecentReviews.js';
import PusherService from './lib/PusherService.js';
import Reviews from './components/Reviews.js';

$(function() {
  console.log('mainjs is being run');
  let recentReviewsElement = document.getElementById('review-carousel')
  if(recentReviewsElement){
    ReactDOM.render(
      <RecentReviews pusherService={new PusherService()}/>,
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
