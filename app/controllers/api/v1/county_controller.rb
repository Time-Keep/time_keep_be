class Api::V1::CountyController < ApplicationController
  def index
    county = County.all
    if county.empty? 
        render json: { error: 'API Rate Limit' }, status: 503
    else
        render json: CountySerializer.counties(county), status: 200
    end
  end
end
