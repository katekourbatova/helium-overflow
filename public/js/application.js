$(document).ready(function() {
  $('#show-answer-form').click(function(event){
    $.get($(this).attr('href'), function(){
      console.log('REQUESTED!');
    })
  })
});
