$(function() {
  $('#edit_area').typeahead([
    {
      name: 'language',
      remote: {
                url: 'resources/lan_detect?q=%QUERY',
                filter: function(parse_response){
                  $('#language_type').text(parse_response.lan + " City: " + parse_response.loc);
                  return '';
                }
      }
    },
    {
      name: 'resource',
      remote: {
                url: 'resources/search?q=%QUERY&m=%METHOD',
                filter: function(parse_response){
                  $('#resource_suggestion').html(parse_response.html);
                  $('#query_string').val($('#edit_area').val());
                },
                replace: function(url, query){
                  search_method = $('select[name="search_method"]').val();
                  return url.replace('%QUERY', query).replace('%METHOD', search_method);
                }
      }
    }
  ]);

  $('#re_query').click(function(){
    search_method = $('select[name="search_method"]').val();
    query_string = $('#query_string').val()
    $.ajax({
      type: 'get',
      url: 'resources/search',
      data:
        {
          m: search_method,
          q: query_string
        },
      success: function(parse_response) {
        if (parse_response.status === 'success') {
          $('#resource_suggestion').html(parse_response.html);
        }
      }
    });
  });

});
