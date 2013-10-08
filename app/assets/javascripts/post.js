$(function() {
  $('#edit_area').typeahead([
    {
      name: 'language',
      remote: {
                url: 'resources/lan_detect?q=%QUERY',
                filter: function(parse_response){
                  $('#language_type').text(parse_response.lan);
                  return '';
                }
      }
    },
    {
      name: 'resource',
      remote: {
                url: 'resources/search?q=%QUERY',
                filter: function(parse_response){
                  $('#resource_suggestion').html(parse_response.html);
                }
      }
    }
  ]);



});
