class TimingzonesController < ApplicationController

before_filter :authenticate_user, only: :new

rescue_from ArgumentError, with: :show_errors

	def index
		@timingzones = Timingzone.all
	end	

	def new
		@timingzone = Timingzone.new 
	end
	
	def create
		@timingzone = Timingzone.new(timingzones_params)
		@timez = daylight(@timingzone.country, @timingzone.state)   # Gets the Timezone with the entered inputs
		@timingzone.dst = @timez.dst?Time.now
		@timingzone.zone_list = @timez.zone
		if @timingzone.save
			redirect_to root_url
		else
			render :new
		end
	end
	
private
	
	def timingzones_params
		params.require(:timingzone).permit(:country, :state)
	end
	
	def daylight(country, state)
		res = Geokit::Geocoders::GoogleGeocoder.geocode("#{state}, #{country}")
		Timezone::Zone.new latlon: res.ll.split(',')
	end
	
	def show_errors
		redirect_to new_timingzone_path, :notice => 'Please enter valid input'
	end


	def authenticate_user
	 	redirect_to new_user_session_path, :notice=>'Please Sign In' if !current_user
	end
	 	
end
