class TaskObserver
  def update(time, result, ex)
    if result
      true
      # print "(#{time}) Execution successfully returned #{result}\n"
    elsif ex.is_a?(Concurrent::TimeoutError)
      # print "(#{time}) Execution timed out\n"
      true
    else
      print "(#{time}) Execution failed with error #{ex}\n"
      true
    end
  end
end
