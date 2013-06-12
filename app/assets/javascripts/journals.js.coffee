# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	editor = CodeMirror.fromTextArea($("#journal_content").get(0), {
	        mode: 'markdown',
	        lineNumbers: true,
	        theme: "default",
	        extraKeys: {"Enter": "newlineAndIndentContinueMarkdownList"}
	      })

	# to decrease parser requests
	# must to execute the callback after a delay time and
	# remains only the last change until delay
	delayCallback = (queueName = 'default',callback,time = 1000) ->
		@delayQueues = {} if !@delayQueues?
		clearInterval(@delayQueues[queueName])
		@delayQueues[queueName] = setTimeout(callback,time)
	
	editor.on("change", (instance,changeObj) ->
		callback = -> 
					$.get($('#journal_content').data('book-parser-url'), {content: editor.getValue()})
		delayCallback('editor',callback,1000)
	)

	$('#story_theme').change ->
		editor.setOption("theme",$(this).val())
