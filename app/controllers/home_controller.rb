class HomeController < ApplicationController
  def index
    @group_ids = Group.where(grade: 9).pluck(:id)
    @students = Student.where(group_id: @group_ids)
  end

  def graph_data
    performance_data = get_performance_data_for_group
    performance_data << get_performance_data_for_student if params[:student].present?

    if request.post?
      @data = performance_data.to_json
      render :graph_data
    else
      render json: performance_data
    end
  end

  private

  def get_performance_data_for_group
    performance_data = Group.performance_data_for_charting
    performance_data << Group.combine_performance_data_for(grade: 9)
  end

  def get_performance_data_for_student
    Student.performance_data_for_charting(
        group_ids:  params[:group_ids],
        student:    params[:student]
      )
  end

end
