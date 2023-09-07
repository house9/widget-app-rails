class Region
  delegate :options_for_select, to: 'ActionController::Base.helpers'

  def initialize
    @data = JSON.parse(IO.read("#{Rails.root}/app/assets/data/country-states-cities.json"))
  end

  attr_reader :data

  def countries
    data.map do |country|
      {
        id: country['id'],
        iso: country['iso3'],
        name: country['name']
      }
    end
  end

  def states(country_id)
    data.find { |country| country['id'] == country_id.to_i }['states'].map do |state|
      {
        id: state['id'],
        name: state['name'],
        abbreviation: state['state_code']
      }
    end
  end

  def cities(country_id, state_id)
    data.find { |country| country['id'] == country_id.to_i }['states'].find { |state| state['id'] == state_id.to_i }['cities'].map do |city|
      {
        id: city['id'],
        name: city['name']
      }
    end
  end

  def countries_html_options
    options_for_select(countries.map { |country| [country[:name], country[:id]] })
  end

  def states_html_options(country_id)
    options_for_select(states(country_id).map { |state| [state[:name], state[:id]] })
  end

  def cities_html_options(country_id, state_id)
    options_for_select(cities(country_id, state_id).map { |city| [city[:name], city[:id]] })
  end
end
