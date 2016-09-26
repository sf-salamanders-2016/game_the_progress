class GraphController < ApplicationController
  def index
  end

  def data
    @results = Result.all
    boolean_array = @results.map do |result|
      result.is_correct
    end
    true_array = boolean_array.select {|boolean| boolean == true}
    true_count = true_array.length
    false_array = boolean_array.select {|boolean| boolean == false}
    false_count = false_array.length
    p true_count
    p false_count
    p boolean_array
    render json: [true_count.to_i, false_count.to_i]
    # respond_to do |format|
    #   format.json {
    #     render :json => [1,2,3,4,5]
    #   }
    # end
  end
end