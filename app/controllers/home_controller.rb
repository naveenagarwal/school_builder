class HomeController < ApplicationController
  def index

  end

  def graph_data
    performance_data = Group.performance_data_for_charting
    performance_data << Group.combine_performance_data_for(grade: 9)

    performance_data << Student.performance_data_for_charting() if params[:student_id]

    render json: performance_data
  end

  def show

  end

end
