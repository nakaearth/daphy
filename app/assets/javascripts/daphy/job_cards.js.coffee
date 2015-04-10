$ ->
  $("#Todo").droppable
    drop: (event, ui) ->
      $.ajax
        type:"PATCH",
        url:"/daphy/job_cards/"+ ui.draggable.attr('id')  + "/change_type?type=Todo",
        contentType:'application/json',
        dataType:'json',

        error: (xhr, msg, error) ->
          alert(msg + ": " + error + ui.draggable.attr('id'));

      ui.draggable.effect('highlight', '', 2000);

  $("#Doing").droppable
    drop: (event, ui) ->
      $.ajax
        type:"PATCH",
        url:"/daphy/job_cards/"+ ui.draggable.attr('id')  + "/change_type?type=Doing",
        contentType:'application/json',
        dataType:'json',

        error: (xhr, msg, error) ->
          alert(msg + ": " + error + ui.draggable.attr('id'));

      ui.draggable.effect('highlight', '', 2000);

  $("#Done").droppable
    drop: (event, ui) ->
      $.ajax
        type:"PATCH",
        url:"/daphy/job_cards/"+ ui.draggable.attr('id')  + "/change_type?type=Done",
        contentType:'application/json',
        dataType:'json',

        error: (xhr, msg, error) ->
          alert(msg + ": " + error + ui.draggable.attr('id'));

      ui.draggable.effect('highlight', '', 2000);
