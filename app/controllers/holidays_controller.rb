require "json"

class HolidaysController < ApplicationController
  def show
    @years = holiday_data_by_year
  end

  def holiday_data_by_year
    symbolize_recursive(JSON.parse(File.read("#{Rails.root}/lib/holiday_data.json")))
  end

  def symbolize_recursive(outer)
    outer.each { |element_outer| element_outer.map! { |element_inner| element_inner.symbolize_keys! } }
  end
end
