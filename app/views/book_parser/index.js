$('#content-output').html('<%= escape_javascript(@content.html_safe) %>');