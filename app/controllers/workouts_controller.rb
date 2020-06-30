class WorkoutsController < ApplicationController

    def new 
        @workout = Workout.new 
        @exercises = Exercise.all 
    end 

    def create 
        @workout = Workout.new(workout_params)
        if @workout.valid? 
            @workout.save 
            redirect_to '/home'
        else 
            flash[:message] = @workout.errors.full_messages
            redirect_to '/workouts/new' 
        end 
    end 

    def show 
        @workouts = Workout.all 
    end 

    def delete 
        @workout = Workout.find(params[:id]) 
        @workout.destroy 
        redirect_to '/workouts' 
    end 


    private 
    def workout_params
        params.require(:workout).permit(:name, :description, exercise_ids: [])
    end 

end 