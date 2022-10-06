# frozen_string_literal: true

class NewLiner
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call env
    [status, headers, body.map { |line| "#{line}\n" }]
  end
end
