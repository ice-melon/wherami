require 'spec_helper'

describe App do
	let(:user) { FactoryGirl.create(:user) }
	before do
		@app = user.apps.build(app_name: "facebook", 
					   package_name: "beatQQ", 
					   app_description:"find girl",
					   fingerprint:"lalalala",
					   website: "",
					   team_name: "usa",
					   status: false,
					   user_id: user.id)
	end

	subject { @app }

	it { should respond_to(:app_name)}
	it { should respond_to(:package_name)}
	it { should respond_to(:app_description)}
	it { should respond_to(:fingerprint)}
	it { should respond_to(:website)}
	it { should respond_to(:team_name)}
	it { should respond_to(:status)}
	it { should respond_to(:user_id)}

	it{ should be_valid }
	its(:user) { should eq user}

	describe "when app_name is duplicated" do
	    before do
	      app_with_same_name = @app.dup
	      app_with_same_name.app_name = @app.app_name.upcase
	      app_with_same_name.save
	    end

	    it { should_not be_valid }
	end


	describe "when user_id is not present" do
		before { @app.user_id = nil }
		it  { should_not be_valid }
	end

	describe "when app_name is not present" do
		before { @app.app_name = nil }
		it  { should_not be_valid }
	end

	describe "when app_description is not present" do
		before { @app.app_description = nil }
		it  { should_not be_valid }
	end

	describe "when app_name is too long" do
		before{ @app.app_name = 'a' * 51 }
		it  { should_not be_valid }
	end

	describe "when package_name is too long" do
		before{ @app.package_name = 'a' * 51 }
		it  { should_not be_valid }
	end

	describe "when app_description is too long" do
		before{ @app.app_description = 'a' * 201 }
		it  { should_not be_valid }
	end

	describe "when website is too long" do
		before{ @app.website = 'a' * 51 }
		it  { should_not be_valid }
	end

	describe "when team_name is too long" do
		before{ @app.team_name = 'a' * 51 }
		it  { should_not be_valid }
	end


end
