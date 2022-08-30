local config = require("lapis.config")

config({"development", "production"}, {
	postgres = {
		host = "127.0.0.1",
		user = "fearless",
		password = "fearless",
		database = "pierdoleto"
	}
})

