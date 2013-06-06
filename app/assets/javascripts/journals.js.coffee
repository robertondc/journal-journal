# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	editor = CodeMirror.fromTextArea($("#journal_story").get(0), {
	        mode: 'markdown',
	        lineNumbers: true,
	        theme: "default",
	        extraKeys: {"Enter": "newlineAndIndentContinueMarkdownList"}
	      })

	$('#story_theme').change ->
		editor.setOption("theme",$(this).val())

