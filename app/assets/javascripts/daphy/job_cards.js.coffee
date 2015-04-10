 $("#Todo").droppable({
    drop: function(event, ui) {
      $.ajax({
        type:"PATCH",
        url:"/daphy/job_cards/"+ ui.draggable.attr('id')  + "/change_type?type=Todo",
        contentType:'application/json',
        dataType:'json',

        // In case that an error happens, capture it and show the details.
        error:function (xhr, msg, error) {
          alert(msg + ": " + error + ui.draggable.attr('id'));
        }
      });
      ui.draggable.effect('highlight', '', 2000);
    }
  });

