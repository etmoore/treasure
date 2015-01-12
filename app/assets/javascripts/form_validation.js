$(document).ready(function() {
  $('textarea').on('blur', function() {
    var tweetMessage = $('#tweet_message').val();
    if(tweetMessage[0] !== '@') {
      console.log('missing handle');
    }
  });
});
