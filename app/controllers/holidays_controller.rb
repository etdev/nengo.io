require "json"

class HolidaysController < ApplicationController
  def show
    @holidays = holiday_data
  end

  def holiday_data
    holidays = JSON.parse(File.read("#{Rails.root}/lib/holiday_data.json")).map! { |entry| entry.symbolize_keys! }
    holidays
  end
end
