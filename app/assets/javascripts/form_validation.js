$(function(){

  var Validator = {
    show_error: function() {
      $('.error').show();
    },
    hide_error: function() {
      $('.error').hide();
    },
  };

  // hide the error message when the user clicks in the textarea
  $('textarea').on('focus', Validator.hide_error);

  // show error if the message doesn't start with a handle
  $('textarea').on('blur', function(){
    var tweetMessage = $('#tweet_message').val();
    if (tweetMessage[0] !== '@') {
      Validator.show_error();
    }
  });

});
