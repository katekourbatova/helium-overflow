$(document).ready(function() {
  $('#show-answer-form').click(function(event){
    event.preventDefault();
    $.get($(this).attr('href'), showAnswerForm)
  })

  $('#main-postbar').on('submit', '#new-answer-form',function(event){
    event.preventDefault();
    var data = $(this).serialize();
    $.post($(this).attr('action'), data, function(response){
      $('#new-answer-form').hide();
      $('#show-answer-form').show();
      $('#main-postbar').append(response);
    })
  })



///////////////////// CALLBACK FUNCTIONS /////////////////////

function showAnswerForm(response){
  $('#show-answer-form').hide();
  $('.question-container').after(response);
  $('#answer-body').focus();
}

});
