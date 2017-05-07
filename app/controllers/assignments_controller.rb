class AssignmentsController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
	
	def index
		@assignments = Assignment.all
	end

#Find assignments by id number
	def show
		@assignment = Assignment.find(params[:id])
	end

	def new
		@assignment = Assignment.new
	end

#Create a new assignment and assign parameter requirements!
	def create
		#render plain: params[:assignment].inspect
		@assignment = Assignment.new(assignment_params)

#Save assignment if requirements met, else refresh the page.
		if (@assignment.save)
			redirect_to @assignment
		else
			render 'new'
		end 
	end

	def edit
		@assignment = Assignment.find(params[:id])
	end

	def update
		@assignment = Assignment.find(params[:id])

#Update assignment if requirements met, else edit assignment.
		if (@assignment.update(assignment_params))
			redirect_to @assignment
		else
			render 'edit'
		end
	end 

#Delete posts
	def destroy
		@assignment = Assignment.find(params[:id])
		@assignment.destroy

		redirect_to assignments_path
	end


#Parameter requirements
	private
	def assignment_params
		params.require(:assignment).permit(:title, :due_date, :class_name, :description)
	end
end

