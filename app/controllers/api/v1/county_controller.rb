class Api::V1::CountyController < ApplicationController
  def index
    county = County.all
    if county.empty? == true
        render json: { error: 'API Rate Limit' }, status: 503
    else
      render json: CountySerializer.counties(county), status: 200
    end
  end

  def docker_index
    json_data = File.read('./db/data/counties.json')
    counties = JSON.parse(json_data, symbolize_names: true)
    render json: counties
  end
end
