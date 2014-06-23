class ForecastController < ApplicationController

	require 'forecast_io'
	require 'typhoeus/adapters/faraday'
	require 'geocoder'

	def index

		# city = request.location	
		userSearch = params[:q]

	 	@geocoder = Geocoder.search(userSearch).first || request.location
	 		
	 	@city = @geocoder.city

	 	unless @geocoder.blank?

	 		lat = @geocoder.latitude 

	 		lng = @geocoder.longitude 

	 		ForecastIO.api_key = '545bc8ee1ee9907df971316c7968014a'

	 		@forecast = ForecastIO.forecast(lat, lng)

	 	end
	 end

end