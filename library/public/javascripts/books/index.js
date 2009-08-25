Event.addBehavior({
 '#new_book_link:click' : function(ev) {
   $('book_form').toggle();
   ev.stop();
 },
 '#new_book' : Remote.Form,
 '.delete_book' : Remote.Link({method : 'delete'})
});