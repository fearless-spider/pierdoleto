local Model = require("lapis.db.model").Model

local Article = Model:extend("articles", {
	relations = {
		{ "user", belongs_to = "User" },
	},
})

function Article:all()
	return Article:select("ORDER BY date desc")
end

return Article
