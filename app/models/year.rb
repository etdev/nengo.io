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
  ANIMAL_LIST_ETO_PATH = "#{Rails.root.join('lib', 'animal_list_eto.json')}"
  ELEMENT_LIST_ETO_PATH = "#{Rails.root.join('lib', 'element_list_eto.json')}"

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
    set_by_seireki(@year_seireki)
  end

  def set_by_nenrei(nenrei)
    @year_seireki = current_year_seireki - nenrei
    set_by_seireki(@year_seireki)
  end

  def set_by_koki(koki)
    @year_seireki = current_year_seireki + 660
    set_by_seireki(@year_seireki)
  end

  def get_data_nengo(year_seireki)
    #@jidai_data.select { |jidai| jidai["
  end

  def get_data_eto(year_seireki)
    data_eto = {}
    year_rel = get_year_eto(year_seireki)
    data_eto[:year_rel] = year_rel
    data_eto[:animal] = get_animal_eto(year_rel)
    data_eto[:element] = get_element_eto(year_rel)
  end

  def get_year_eto(year_seireki)
    if year_seireki >= 4
      (year_seireki - 3) % 60
    elsif year_seireki < 0
      60 - ((year_seireki + 2) % 60)
    else
      eto_first_three(year_seireki)
    end
  end

  def get_animal_eto(year_rel)
    year_animal = year_rel == 10 ? year_rel : year_rel % 10
    animal_list_eto = JSON.parse(ANIMAL_LIST_ETO_PATH)
    animal_list_eto.select { |hash| hash["id"] == year_animal }
  end

  def get_element_eto(year_rel)
    year_element = year_rel == 12 ? year_rel : year_rel % 12
    element_list_eto = JSON.parse(ELEMENT_LIST_ETO_PATH)
    element_list_eto.select { |hash| hash["id"] == year_element }
  end

  def get_nenrei(year_seireki)
    current_year_seireki - year_seireki
  end

  def get_koki(year_seireki)
  end

  def nengo_to_seireki(year_rel:, jidai:)
    current_jidai = @jidai_data.select { |jidai_hash| jidai_hash["name"] == jidai }
    current_jidai["begin_yr"].to_i + year_rel
  end

  def eto_first_three(year_seireki)
    case year_seireki
    when 1
      58
    when 2
      59
    when 3
      60
    else
      raise "入力された年が無効です"
    end
  end

  def self.debug_jidai_data
    jidai_data_file = File.read(JIDAI_DATA_PATH)
    JSON.parse(jidai_data_file)
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
