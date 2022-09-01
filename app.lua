local lapis = require("lapis")
local Model = require("lapis.db.model").Model
local respond_to = require("lapis.application").respond_to

local app = lapis.Application()

app:enable("etlua")
app.layout = require("views.layout")

local Articles = Model:extend("articles")

app:get("index", "/", function(self)
	self.articles_count = Articles:count()
	local article = Articles:create({
		title="Hello",
		content="THis is test"
	})
	return { render = "index" }
end)
app:get("tluszczakomiesak", "/miesaki/tluszczakomiesak/", function()
	return { render = "tluszczakomiesak" }
end)
app:get("dioksyny", "/dioksyny/", function()
	return { render = "dioksyny" }
end)
app:get("miesaki", "/miesaki/", function()
	return { render = "miesaki" }
end)

app:match(
	"contact",
	"/kontakt",
	respond_to({
		GET = function()
			return { render = "contact" }
		end,
		POST = function(self)
			return { redirect_to = self:url_for("index") }
		end,
	})
)

return app
