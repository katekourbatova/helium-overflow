$(document).ready(function() {
  $('#show-answer-form').click(function(event){
    event.preventDefault();
    $.get($(this).attr('href'), function(response){
      $('#show-answer-form').hide();
      $('.question-container').after(response);
      $('#answer-body').focus();
    })
  })
});
