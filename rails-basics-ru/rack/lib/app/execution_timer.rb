# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    start = Time.now
    status, headers, body = @app.call env
    finish = Time.now
    execution_time = (finish - start) * 1_000_000.0
    [status, headers, body.append("exeuction_time = #{execution_time.to_i} (micro seconds)")]
    # END
  end
end
