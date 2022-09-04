local config = require("lapis.config")

config("development", {
	postgres = {
		host = "172.20.0.1",
		user = "fearless",
		password = "fearless",
		database = "pierdoleto"
	}
})
config("local", {
	postgres = {
		host = "127.0.0.1",
		user = "fearless",
		password = "fearless",
		database = "pierdoleto"
	}
})

