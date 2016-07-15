import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import RecentReviews from './components/RecentReviews.js';
import Reviews from './components/Reviews.js';

if(document.getElementById('testing')){
  import PusherService from './lib/FakePusherService.js';
} else {
  import PusherService from './lib/PusherService.js';
}

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
