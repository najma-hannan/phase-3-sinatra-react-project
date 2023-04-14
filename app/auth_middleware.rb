class AuthTokenMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    auth = Rack::Auth::AbstractRequest.new(env)
    return unauthorized unless auth.provided?
    return bad_request unless auth.scheme == "bearer"

    user = valid?(auth.params)

    return unauthorized unless user

    env[:current_user] = user

    @app.call(env)
  end

  private

  def valid?(token)
    User.find_by(token: token)
  end

  def challenge
    'Bearer realm="%s"' % realm
  end

  def unauthorized
    [401, { "WWW-Authenticate" => challenge }, ["Unauthorized"]]
  end

  def bad_request
    [400, {}, ["Bad Request"]]
  end

  def realm
    "Application"
  end
end
