local lapis = require("lapis")
local respond_to = require("lapis.application").respond_to
local app = lapis.Application()
app:enable('etlua')
app.layout = require "views.layout"

app:get("index", "/", function()
  return { render = "index" }
end)

app:match("contact", "/kontakt", respond_to(
{
  GET = function ()
    return { render = "contact" }
  end,
  POST = function (self)
    return { redirect_to = self:url_for("index")}
  end
}
))

return app
