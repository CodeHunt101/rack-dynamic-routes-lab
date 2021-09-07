class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item_price = @@items.find{|item| item.name == item_name}.price
      resp.write item_price
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end