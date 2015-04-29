class NengosController < ApplicationController
  def index
    @current_year = Year.new
  end
end

