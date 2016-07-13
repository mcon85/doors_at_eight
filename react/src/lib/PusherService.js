import PUSHER_PUBLIC_KEY from './PusherPublicKey';

class PusherService {
  constructor(callback) {
    Pusher.logToConsole = true;

    this.pusher = new Pusher(PUSHER_PUBLIC_KEY, {
      encrypted: true
    });

    this.channel = this.pusher.subscribe('review_channel');

    this.channel.bind('new_review', function(data) {
      callback(data);
    });
  }
}

export default PusherService;
