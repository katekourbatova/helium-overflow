$(document).ready(function() {
  $('#show-answer-form').click(function(event){
    event.preventDefault();
    $.get($(this).attr('href'), showAnswerForm)
  })

  $('#main-postbar').on('submit', '#new-answer-form',function(event){
    event.preventDefault();
    console.log('I clicked!!!');
  })



///////////////////// CALLBACK FUNCTIONS /////////////////////

function showAnswerForm(response){
  $('#show-answer-form').hide();
  $('.question-container').after(response);
  $('#answer-body').focus();
}

});
