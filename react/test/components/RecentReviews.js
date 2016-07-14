import RecentReviews from 'components/RecentReviews';
import Review from 'components/Review';
import FakePusherService from 'lib/FakePusherService';

describe('RecentReview', () => {
  let wrapper;

  beforeEach(() => {
    jasmine.Ajax.install();
  })

  afterEach(function() {
    jasmine.Ajax.uninstall();
  });

  it('should display a list of reviews returned from an ajax call', () => {
    let reviews = [
      {
        id: 1,
        rating: 2,
        body: 'This place is great',
        venue_id: 3,
        venue_name: 'Awesome Place'
      },
      {
        id: 2,
        rating: 3,
        body: 'This is another great place',
        venue_id: 4,
        venue_name: 'Nice Venue'
      }
    ]

    jasmine.Ajax.stubRequest('/api/reviews').andReturn({
        "status": 200,
        "contentType": "application/json",
        "responseText": JSON.stringify({ reviews: reviews })
      });

    wrapper = mount(
      <RecentReviews pusherService={new FakePusherService()}/>
    );

    expect(wrapper).toContainReact(<Review venueId={3}
                                           venueName={'Awesome Place'}
                                           body={'This place is great'}
                                           rating={2} />)
    expect(wrapper).toContainReact(<Review venueId={4}
                                           venueName={'Nice Venue'}
                                           body={'This is another great place'}
                                           rating={3} />)
  });
});
