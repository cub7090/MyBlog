class ApplicationController < ActionController::Base
	layout 'author'

	def render404
		respond_to do |format|
			format.html { render :file => "#{Rails.root}/public/404.html", :layout => false, :status => :not_found }
			format.xml  { head :not_found }
			format.any  { head :not_found }
		end
	end
end
