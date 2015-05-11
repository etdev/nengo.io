class NengosController < ApplicationController
  def index
    @current_year = Year.new
  end

  def update
    @current_year = reload_data
    render :index
  end

  def edit
    @edit_mode = 1
    @current_year = Year.new
    @current_year.set_by_seireki(params[:year_seireki].to_i)
    render :index
  end

  private
    def reload_data
      # seireki: year; nengo: year, jidai; nenrei: year, eto: X, koki: year
      current_year = Year.new
      case params[:refresh_type]
      when "seireki"
        current_year.set_by_seireki(params[:year_seireki].to_i)
      when "nengo"
        current_year.set_by_nengo({ year_rel: params[:year_rel_nengo].to_i, jidai: params[:jidai] })
      when "nenrei"
        current_year.set_by_nenrei(params[:nenrei].to_i)
      when "koki"
        current_year.set_by_koki(params[:year_koki].to_i)
      else
        flash[:notice] = NengoErrors::failure[:invalid_data]
      end
      current_year
    end
end

