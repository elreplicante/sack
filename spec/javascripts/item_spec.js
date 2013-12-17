describe("Saving an item with Ajax", function() {
var configuration = { url: "/items", remainingCallTime: 30000, type: 'POST' };
var item = { 'url': 'http://example.com' };

  it("should make an Ajax request to the correct URL", function() {
    spyOn($, "ajax");

    sendRequest(undefined, configuration);

    expect($.ajax.mostRecentCall.args[0]["url"]).toEqual(configuration.url);
  });

  it("should receive a successful response", function() {
    spyOn($, "ajax").andCallFake(function(e) {
        e.success({});
    });
    var callbacks = {
        displaySuccessMessage: jasmine.createSpy(),
        displayErrorMessage: jasmine.createSpy(),
    };
 
    sendRequest(callbacks, configuration);

    expect(callbacks.displaySuccessMessage).toHaveBeenCalled();
    expect(callbacks.displayErrorMessage).not.toHaveBeenCalled();
  });

  it("should receive an Ajax error", function() {
    spyOn($, "ajax").andCallFake(function(e) {
        e.error({});
    });
     var callbacks = {
        displayErrorMessage : jasmine.createSpy()
    };
 
    sendRequest(callbacks, configuration);
    expect(callbacks.displayErrorMessage).toHaveBeenCalled();
 
  });
});