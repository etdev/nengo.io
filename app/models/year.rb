# coding: utf-8
class Year
  attr_reader :year_seireki
  attr_reader :data_nengo
  attr_reader :nenrei
  attr_reader :data_eto
  attr_reader :koki

  def initialize
    @year_seireki = current_year
    @data_nengo = get_data_nengo(@year_seireki)
    @nenrei = get_nenrei(@year_seireki)
    @data_eto = get_data_eto(@year_seireki)
    @koki = get_koki(@year_seireki)
  end

  def current_year_seireki
    Time.zone.now.year
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
