var   configuration = {
  url: '/items',
  type: 'POST',
  remainingCallTime: 30000
}

var displaySuccessMessage = function() {
  $( "#success-message" ).css('visibility', 'visible');
  $('#modal-close').click(function(event) {
    $( "#success-message" ).css('visibility', 'hidden');
  });
}


var displayErrorMessage = function() {
  $( "#success-message" ).css('visibility', 'visible');
  $('#modal-close').click(function(event) {
    $( "#success-message" ).css('visibility', 'hidden');
  });
}

var callbacks = {
  displaySuccessMessage: displaySuccessMessage,
  displayErrorMessage: displayErrorMessage
}

function sendRequest(callbacks, configuration, item) {
    $.ajax({
        url: configuration.url,
        type: configuration.type,
        data: item.url,
        cache: false,
        success: function(data) {
            callbacks.displaySuccessMessage();
        },
        error: function(data) {
            callbacks.displayErrorMessage();
        },
        timeout: configuration.remainingCallTime
    });
} 



