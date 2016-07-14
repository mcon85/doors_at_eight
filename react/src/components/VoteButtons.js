import React, { Component } from 'react';

class VoteButtons extends Component {
  constructor(props) {
    super(props);

    this.state = {
      vote: null
    }

    this.clickUpvote = this.clickUpvote.bind(this);
    this.clickDownvote = this.clickDownvote.bind(this);
    this.saveVote = this.saveVote.bind(this);
    this.updateVote = this.updateVote.bind(this);
    this.getVote = this.getVote.bind(this);
    this.upVoteClass = this.upVoteClass.bind(this);
    this.downVoteClass = this.downVoteClass.bind(this);
  }

  componentDidMount() {
    this.getVote();
  }

  getVote(){
    $.ajax({
      url:`/api/reviews/${this.props.reviewId}/votes`,
      method:'GET',
    })
    .success(data => {
      this.setState({ vote: data.vote });
    });
  }

  clickUpvote(event) {
    event.preventDefault();
    this.saveVote('up');
  }

  clickDownvote(event) {
    event.preventDefault();
    this.saveVote('down');
  }

  saveVote(vote_type) {
    $.ajax({
      url:`/api/reviews/${this.props.reviewId}/votes`,
      method:'POST',
      success: this.updateVote,
      data: {
        vote_type: vote_type
      }
    });
  }

  updateVote(data) {
    this.setState({ vote: data.vote });
  }

  upVoteClass() {
    let voteClass = 'upvote-button';
    if(this.state.vote && this.state.vote.vote_type == 'up'){
      voteClass = voteClass + ' green';
    }
    return voteClass;
  }

  downVoteClass() {
    let voteClass = 'downvote-button';
    if(this.state.vote && this.state.vote.vote_type == 'down'){
      voteClass = voteClass + ' red';
    }
    return voteClass;
  }

  render() {
    if(this.props.currentUser){
      return (
        <div className="votes columns small-1 medium-1">
          <div className="upvote">
            <button type="submit"
                    className={this.upVoteClass()}
                    onClick={this.clickUpvote}>
              <i className="fa fa-chevron-up"></i>
            </button>
          </div>
          <div className="downvote">
            <button type="submit"
                    className={this.downVoteClass()}
                    onClick={this.clickDownvote}>
              <i className="fa fa-chevron-down"></i>
            </button>
          </div>
        </div>
      );
    } else {
      return <div></div>;
    }
  }

}

export default VoteButtons;
