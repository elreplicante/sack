var configuration = {
  'url': '/items',
  'type': 'UPDATE'
}


function sendRequest(callbacks, configuration, item) {
    $.ajax({
        url: configuration.url,
        dataType: "json",
        type: configuration.type,
        data: item,
        cache: false,
        success: function(data) {
            callbacks.displaySuccessMessage(data);
        },
        error: function(data) {
            callbacks.displayErrorMessage();
        },
        timeout: configuration.remainingCallTime
    });
}

function displaySuccessMessage() {
  $( "#success-message" ).css('visibility', 'visible');
  $('#modal-close').click(function(event) {
    $( "#success-message" ).css('visibility', 'hidden');
  });
}


