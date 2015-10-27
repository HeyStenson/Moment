$(document).ready(function(){
	$("#new-memory-text").each(function() {
	    var $this = $(this);
	    var maxLength = parseInt($this.attr('maxlength'));
	    $this.attr('maxlength', null);
	    
	    var el = $("<span>" + maxLength + " characters left" + "</span>");
	    el.insertAfter($this);
	    
	    $this.bind('keyup', function() {
	        var cc = $this.val().length;
	        
	        el.text(maxLength - cc + " characters left");
	        
	        if(maxLength < (cc + 15)) {
	            el.css('color', 'red');
	        } else {
	            el.css('color', null);
	        }
	    });
	});
});