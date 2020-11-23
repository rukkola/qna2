S ->
  $('form.new_answer').bind 'ajax:success', (e, data, status, xhr) ->
    $('.answers').html(xhr.responseText)
  .bind 'ajax:error', (e, xhr, status, error) ->
    $('.answer-errors').html(xhr.responseText)