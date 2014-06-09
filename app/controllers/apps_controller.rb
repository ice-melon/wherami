class AppsController < ApplicationController
	 before_action :signed_in_user, only: [:create, :destroy, :show, :new, :index, :edit, :update]
	 before_action :isBelongToUser, only: [:show, :destroy, :edit, :update]
	 before_action :admin_user, only:[:index]


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

	def index
		@apps = App.paginate(page: params[:page], :per_page => 20)
	end

	def edit
		@app = App.find(params[:id])
	end

	def update
		@app = App.find(params[:id])
		if @app.update_attributes(app_params)
	      flash[:success] = "app info updated"
	      redirect_to @app
	    else
	      render 'edit'
	    end
	end

	def destroy
		App.find(params[:id]).destroy
		flash[:success] = "App deleted"
		if current_user.admin?
			redirect_to apps_path
		else
			redirect_to current_user
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

		def isBelongToUser
			if !current_user.admin?
				@app = current_user.apps.find_by(id: params[:id])
				if !@app
					redirect_to current_user 
				end				
			end
		end

	    def admin_user
	    	if !current_user.admin?
	    		redirect_to(current_user)  
	    	end
	    end		

end