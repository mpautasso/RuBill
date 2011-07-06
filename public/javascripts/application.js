// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  // Sorting and pagination links.  
  $('#failed_calls th a, #failed_calls .pagination a').live('click',   
    function () {  
      $.getScript(this.href);  
      return false;  
    }  
  );  
  
  // Search form.  
  $('#failedcalls_search').submit(function () {  
    console.log(this.action);
    console.log($(this).serialize());
    $.get(this.action, $(this).serialize(), null, 'script');  
    return false;  
  });  
});  
