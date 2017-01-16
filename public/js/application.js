$(document).ready(function() {
  $('#show-answer-form').click(function(event){
    event.preventDefault();
    $.get($(this).attr('href'), showAnswerForm)
  })

  $('#main-postbar').on('submit', '#new-answer-form',function(event){
    event.preventDefault();
    var data = $(this).serialize();
    $.post($(this).attr('action'), data, showNewAnswer)
      .fail(showAnswerFail)
  })

  $('#main-postbar').on('submit', '#new-comment-form',function(event){
    event.preventDefault();
    var data = $(this).serialize();
    $.post($(this).attr('action'), data, showNewComment)
      .fail(function(response) {console.log(response)})
  })

$('#show-comment-form').click(function(event){
    event.preventDefault();
    $.get($(this).attr('href'), showCommentForm)
  })


///////////////////// CALLBACK FUNCTIONS /////////////////////

function showAnswerForm(response){
  $('#show-answer-form').hide();
  $('.question-container').after(response);
  $('#answer-body').focus();
}

function showCommentForm(response){
  $('#show-comment-form').hide();
  $('.question-container').after(response);
  $('#comment-body').focus();
}

function showNewAnswer(response){
  removeErrors();
  $('#new-answer-form').hide();
  $('#show-answer-form').show();
  $('#main-postbar').append(response);
}

function showNewComment(response){
  removeErrors();
  $('#new-comment-form').hide();
  $('#show-comment-form').show();
  $('.question-container').after(response);
}

function showAnswerFail(response){
  removeErrors()
  $('.question-container').after(response.responseText)
}

function showCommentsFail(response){
  removeErrors()
  $('.question-container').after(response.responseText)
}

function removeErrors(){
  $('.error').remove();
}

});
