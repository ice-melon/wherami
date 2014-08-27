class AppsController < ApplicationController
	 before_action :signed_in_user, only: [:create, :destroy, :show, :new, :index, :edit, :update]
	 before_action :isBelongToUser, only: [:show, :destroy, :edit, :update]
	 before_action :admin_user, only:[:index]

	 respond_to :json


	def show
		apps = current_user.apps
		@app = App.find(params[:id])
	end

	def new
		@app = App.new
	end

	def create
		@app = current_user.apps.build(app_params)
		@app.fingerprint.gsub!(/:/,'')
		@app.status = true
		if @app.save
			flash[:success] = "apply success! Approvement will take 1 day!"
			redirect_to current_user
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
		app_params[:fingerprint].gsub!(/:/,'')
		if @app.update_attributes(app_params)
	      flash[:success] = "App Info Updated"
	      redirect_to current_user
	    else
	      render 'edit'
	    end
	end

	def destroy
		app = App.find(params[:id])
		app.destroy
		flash[:success] = "#{app.app_name} Deleted"
		redirect_to :back
	end

	def changeStatus
		@app = App.find(params[:id])
		@app.update_attribute(:status, !@app.status)
		flash[:success] = "#{@app.app_name}'s status change to #{@app.status}"
		redirect_to :back
	end


	def status
		package_name = params[:package_name]
		fingerprint  = params[:fingerprint]
		
		@app = App.find_by(package_name: package_name)
#		p @app.fingerprint
		if @app.fingerprint[fingerprint]
#			p @app.fingerprint[fingerprint]
			render json: @app.status
		else
#			p "failed"
#			p @app.fingerprint[fingerprint]
			render json: false
		end  
	end

	private
		def app_params
			params.require(:app).permit(:app_name,
										:package_name,
										:app_description,
										:website,
										:team_name,
										:fingerprint)
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
