class ApplicationController < ActionController::Base

	def per_page
		params[:per_page] || 30
	end

end
