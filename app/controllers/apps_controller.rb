class AppsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show, :new]

	def show
		apps = current_user.apps
		@app = App.find(params[:id])
	end

	def new
		@app = App.new
	end

	def create
		@app = current_user.apps.build(app_params)
		if @app.save
			flash[:success] = "success"
			redirect_to @app
		else
			render 'new'
		end
	end


	private
		def app_params
			params.require(:app).permit(:app_name,
										:package_name,
										:app_description,
										:website,
										:team_name)
		end

		def isBelong
			
		end

end