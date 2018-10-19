class StudentAssignmentsController < ApplicationController
  def create
    @student_assignment = StudentAssignment.create(student_assignment_params)
    render json: @student_assignment
  end

  def update
    @student_assignment = StudentAssignment.find(params[:id])
    @student_assignment.update(student_assignment_params)
    render json: @student_assignment
  end

  private
  def student_assignment_params
    params.require(:student_assignment).permit(:student_id, :assignment_id, :points_earned, :status).tap do |white_list|
      white_list[:answers] = params[:student_assignment][:answers].permit! if params[:student_assignment][:answers]
    end
  end

end
