local csrf = require("lapis.csrf")
local respond_to = require("lapis.application").respond_to
local app_helpers = require("lapis.application")

local yield_error, capture_errors, assert_error =
	app_helpers.yield_error, app_helpers.capture_errors, app_helpers.assert_error

local User = require("models.User")

return function(app)
	app:get(
		"/admin",
		capture_errors(function(self)
			if not self.session.current_user then
				yield_error("Not authorized.")
			end
			return { render = "admin.index" }
		end)
	)

	app:match(
		"/admin/login",
		respond_to({
			GET = capture_errors(function(self)
				self.csrf_token = csrf.generate_token(self)
				return { render = "admin.login" }
			end),
			POST = capture_errors(function(self)
				csrf.assert_token(self)
				if self.params then
					local user = assert_error(User:verify(self.params))
					if not user then
						yield_error("Could not verify user.")
					else
						self.session.current_user = { id = user.id, name = user.name, email = user.email }
						return { redirect_to = "/admin" }
					end
				else
					return { redirect_to = "/admin/login" }
				end
			end),
		})
	)
	app:get("/admin/logout", function(self)
		self.session.current_user = nil
		return { redirect_to = "/" }
	end)
end
