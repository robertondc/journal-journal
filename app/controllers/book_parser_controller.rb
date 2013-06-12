class BookParserController < ApplicationController

  require 'book_parser'

  def index
    @content = BookParser.new(params[:content]).parse('markdown','html')
    puts params[:content]
	  respond_to do |format|
	    format.js { @content }
	  end
  end
end