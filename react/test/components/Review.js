import Review from 'components/Review';

describe('Review', () => {
  let wrapper, props;

  beforeEach(() => {
    props = {
      venueId: 1,
      venueName: 'awesome Venue',
      rating: 3,
      body: 'it is the best'
    };
    wrapper = shallow(
      <Review {...props} />
    );
  })
  it('should display its props', () => {
    expect(wrapper.text()).toContain(props.venueName);
    expect(wrapper.text()).toContain(props.rating);
    expect(wrapper.text()).toContain(props.body);
    expect(wrapper.find('a').props().href).toEqual('/venues/1');
  });
});
