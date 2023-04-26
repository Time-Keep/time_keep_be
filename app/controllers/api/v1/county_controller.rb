class Api::V1::CountyController < ApplicationController
  def index
    county = County.all
    render json: CountySerializer.counties(county), status: 201
  end
end
