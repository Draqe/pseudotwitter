// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .



$(document).ready(function(){
  $('#tweet_submit').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: '/tweets',
      type: 'POST',
      dataType: 'json',
      data: {tweet: {text: $('#text').val()}},
      success: function(tweet){
        console.log(tweet);
        $('#tweets').load('/tweets/show');
      },
      error: function(data){
        console.log(data);
      }
    });
  });

  $('#reply_submit').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: '/tweets',
      type: 'POST',
      dataType: 'json',
      data: {tweet: {text: $('#text').val()}, type: 'Reply'},
      success: function(data){
        console.log(data);
        $('#replies').load('/tweets/show_replies');
      },
      error: function(data){
        console.log(data);
      }
    });
  });
});
