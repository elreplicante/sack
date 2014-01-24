describe("App", function() {

  var html2test='<div id="html2test" style="visibility:hidden"></div>';
  var input = '<input id="url-input" type="url"></input>';
  var invalidInput = 'hola';
  var validInput = "http://www.as.com";
  var url;

  beforeEach(function(){
    $('body').append(html2test);
    $('#html2test').append(input);
    url = $('#url-input');
  });

  describe("When adding a new URL", function() {
    it("shows an error if invalid URL", function() {
      spyOn(App, '_showError');
      url.val(invalidInput);
      console.log(url.val());
      App.validateURL();
      expect(App._showError).toHaveBeenCalled();
    });

    it("saves the item if URL is valid", function() {
      spyOn(App, "saveItem");
      url.val(validInput);
      console.log(url.val());
      App.validateURL(validInput);
      expect(App.saveItem).toHaveBeenCalled();
    });
  });
  
  afterEach(function() {
    $('#html2test').remove();
  });

});


