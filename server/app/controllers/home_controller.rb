class HomeController < ApplicationController
  def index
  end

  def hello_htmx
    render layout: false
  end
end
