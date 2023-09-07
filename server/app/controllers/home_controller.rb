class HomeController < ApplicationController
  def index
  end

  def hello_htmx
    # sleep(2)

    # re-write address bar
    headers['HX-Push'] = Faker::Mountain.name.parameterize

    # actual redirect
    # headers['HX-Redirect'] = widgets_path

    render layout: false
  end
end
