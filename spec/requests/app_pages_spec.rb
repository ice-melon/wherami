require 'spec_helper'

describe "App Pages" do
	subject { page }

    let(:user) { FactoryGirl.create(:user) }
    before { sign_in(user) }

	describe "New API Request Page" do
		before { visit new_app_path }

		it { should have_content('App name')}
		it { should have_title('New API Request')}
	end
	
	describe "create new app " do
		before { visit new_app_path }

		let(:submit) {"Submit"}

		describe "with invalid information" do
			it "should not create a app" do 
				expect { click_button submit }.not_to change(App, :count)
			end
		end

		describe "with valid information" do
			before do 
				fill_in "App name",         	with: "QQ"
				fill_in "Package name",         with:"haha" 
				fill_in "App description",      with:"fuck 360" 
				fill_in "Team name",         	with:"fuck ali" 
				fill_in "Website",        	 	with:"www.qq.com"  
			end

			it "should create an app" do
				expect { click_button submit }.to change(App, :count).by(1)
			end


			describe "after saving the app" do
				before { click_button submit }
				it { should have_content('fuck 360') }
			end

		end
	end	

	describe "show app" do
		
	end
end
