class BookParser

	require 'kramdown'
	
	def initialize(content)
		@content = content
	end

	def parse(from,to)
		Kramdown::Document.new(@content, :input => from).to_html
	end

end