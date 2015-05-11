class NengosController < ApplicationController
  def index
    @current_year = Year.new
  end

  def update
    @current_year = reload_data
    redirect_to :root
  end

  def edit
    @edit_mode = 1
    @current_year = Year.new
    @current_year.set_by_seireki(params[:current_year_seireki].to_i)
    render :index
  end

  private
    def reload_data
      # seireki: year; nengo: year, jidai; nenrei: year, eto: X, koki: year
      case params[:refresh_type]
      when "seireki"
        @current_year.set_by_seireki(params[:year_seireki])
      when "nengo"
        @current_year.set_by_nengo({ year_rel: params[:year_rel_nengo], jidai: params[:jidai] })
      when "nenrei"
        @current_year.set_by_nenrei(params[:nenrei])
      when "koki"
        @current_year.set_by_koki(params[:year_koki])
      else
        flash[:notice] = NengoErrors::failure[:invalid_data]
      end
    end
end

