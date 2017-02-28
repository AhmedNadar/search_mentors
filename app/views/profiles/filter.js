$('#profile_filter').append("<%= escape_javascript render(:partial => '/profiles/profile_list', :locals => { :filter => @profiles }) %>");
