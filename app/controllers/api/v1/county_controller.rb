class Api::V1::CountyController < ApplicationController
  def index
    county = County.all
    #require 'pry'; binding.pry 
    if county.empty? == true
        render json: { error: 'API Rate Limit' }, status: 503
    else
        render json: CountySerializer.counties(county), status: 200
    end
  end
end
