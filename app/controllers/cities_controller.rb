class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def update_volume
    @city = City.find(params[:id])
    response = RestClient.get "https://data.block.cc/api/v3/markets?api_key=NRL9HC7ZSIWQU4JKMFPGUIZJMZFTWAXNH38SSVL1&size=100"
    data = JSON.parse(response.body)
    @city.update( :volume => data[@city.block_id.to_i]["volume"] )
    redirect_to cities_path
  end
end
