# coding: utf-8
require "json"

class Year
  attr_reader :year_seireki
  attr_reader :data_nengo
  attr_reader :nenrei
  attr_reader :data_eto
  attr_reader :koki
  attr_reader :jidai_data

  JIDAI_DATA_PATH = "#{Rails.root.join('lib', 'jidai_data.json')}"

  def initialize
    @jidai_data = load_jidai_data(JIDAI_DATA_FILE)
    set_by_seireki(current_year_seireki)
  end

  def set_by_seireki(year_seireki)
    @year_seireki = year_seireki
    @data_nengo = get_data_nengo(@year_seireki)
    @nenrei = get_nenrei(@year_seireki)
    @data_eto = get_data_eto(@year_seireki)
    @koki = get_koki(@year_seireki)
  end

  def current_year_seireki
    Time.zone.now.year
  end

  def set_by_nengo(nengo_data)
    @year_seireki = nengo_to_seireki(nengo_data)
  end

  def set_by_nenrei(nenrei)
  end

  def set_by_koki(koki)
  end

  def get_data_nengo(year_seireki)
  end

  def get_nenrei(year_seireki)
  end

  def get_data_eto(year_seireki)
  end

  def get_koki(year_seireki)
  end

  def nengo_to_seireki(year_nengo:, jidai:)

  end

  private
    def set_for_seireki(year_seireki)
      @data_nengo = get_data_nengo(@year_seireki)
      @nenrei = get_nenrei(@year_seireki)
      @data_eto = get_data_eto(@year_seireki)
      @koki = get_koki(@year_seireki)
    end

    def load_jidai_data(jidai_data_filename)
      jidai_data_file = File.read(jidai_data_filename)
      JSON.parse(jidai_data_file)
    end

# Things that can change:
#  * Seireki year
#  * Nengo year
#  * Nengo jidai
#  * Nenrei
#  * Koki

# Things I want to do:
# Populate all fields from a Seireki year
# Populate all fields from a Nengo year + jidai
# Populate all fields from a Nenrei
end
