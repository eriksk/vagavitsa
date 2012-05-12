class HomeController < ApplicationController
  def index
  	redirect_to :controller => 'jokes', :action => 'next'
  end
end
