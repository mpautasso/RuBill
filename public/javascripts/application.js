// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  // Sorting and pagination links.  
  $('tr.ajaxifyme th a, .pagination a').live('click',   
    function () {  
      $.getScript(this.href);  
      return false;  
    }  
  );  
  
  // Search form.  
  $('#users_search, #devices_search, #outgoingcalls_search, #incommingcalls_search, #failedcalls_search, #rates_search, #csvfiles_search').submit(function () {
    $.ajax({
        type: "GET",
        dataType: 'script',
        url: this.action,
        data: $(this).serialize(),
        beforeSend: function(){
            if ($("#search").attr('value') == ''){
              alert("You are looking for with an empty filter");
              return false;
            }
            $("#spin").show();
        },
        complete: function() {
            $("#spin").hide();
        }
      });

    return false;
  });  
});

