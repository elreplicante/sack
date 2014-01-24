var App = {};

App.validateURL = function() {
  var url = $('#url-input').val();
  if (App._isValid(url)) {
    App.saveItem();
  } else {
    App._showError();
  }
};

App.saveItem = function() {
  //TODO ajax post
  $('body').append('<div class="alert">URL added to the sack!</div>');
};

App._isValid = function(url) {
  return (/^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/|www\.)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/.test(url));

};

App._showError = function() {
  $('body').append('<div class="alert">Bad url </div>');
};

App._urlForm = function() {
  return $('#url-input');
};

App.initialize = function(){
  App._urlForm().on('change', App.validateURL);
};

$(document).ready(function() {
  App.initialize();
});