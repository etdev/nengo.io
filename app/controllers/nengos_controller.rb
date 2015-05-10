class NengosController < ApplicationController
  def index
    @current_year = Year.new
  end

  def update
    @current_year = reload_data
  end

  private
    def reload_data
      # seireki: year; nengo: year, jidai; nenrei: year, eto: X, koki: year
    end
end

