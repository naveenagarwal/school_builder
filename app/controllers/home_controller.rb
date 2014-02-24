class HomeController < ApplicationController
  def index
    @group_ids = Group.where(grade: 9).pluck(:id)
    @students = Student.where(group_id: @group_ids)
  end

  def graph_data
    performance_data = Group.performance_data_for_charting
    performance_data << Group.combine_performance_data_for(grade: 9)

    if params[:student]
      performance_data << Student.performance_data_for_charting(
                            group_ids:  params[:group_ids],
                            student:    params[:student]
                        )

      @data = performance_data.to_json
      render :graph_data
    else
      render json: performance_data
    end

  end

  def show

  end

end
