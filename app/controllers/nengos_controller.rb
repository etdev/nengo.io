class NengosController < ApplicationController
  def index
    @current_year = Year.new
    @current_year.set_by_seireki(params[:year_seireki].to_i) if params[:year_seireki].present?
  end

  def update
    current_year = reload_data(submit_type)
    redirect_to action: :index, year_seireki: current_year.year_seireki
  rescue
    flash[:notice] = "入力したデータが不正の為変換に失敗しました"
    redirect_to action: :index
  end

  def edit
    @edit_mode = edit_mode_from_params(params)
    @current_year = Year.new
    @current_year.set_by_seireki(params[:year_seireki].to_i)
    render :index
  rescue
    flash[:notice] = "入力したデータが不正の為変換に失敗しました"
    render :index
  end

  def about
    render
  end

  private
    def reload_data(submit_type)
      # seireki: year; nengo: year, jidai; nenrei: year, eto: X, koki: year
      current_year = Year.new
      case submit_type
      when "seireki"
        current_year.set_by_seireki(params[:year_seireki].to_i)
      when "nengo"
        current_year.set_by_nengo({
          year_rel: params[:year_rel_nengo].to_i,
          jidai: params[:jidai][/[^\s]+/]
        })
      when "nenrei"
        current_year.set_by_nenrei(params[:year_nenrei].to_i)
      when "koki"
        current_year.set_by_koki(params[:year_koki].to_i)
      else
        flash[:notice] = NengoErrors::failure[:invalid_data]
      end
      current_year
    end

    def edit_mode_from_params(data)
      %w(seireki nengo nenrei koki).each do |type|
        return type if data[type].present?
      end
    end

    def submit_type
      params["submit-type"]
    end
end

