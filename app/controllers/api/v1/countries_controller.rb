class Api::V1::CountriesController < Api::V1::BaseController
  def index
    @countries = Country.all
    options_api = {}
    options_api[:meta] = { total: @countries.count }
    render_json(@countries, options_api)
  end

  def show 
    @country = Country.find(params[:id])
    render_json(@country)
  end

  private 

  def render_json(countries, options_api={})
    json_api = CountrySerializer.new(countries, options_api).serializable_hash.to_json
    render json: json_api
  end
end
