local Model = require("lapis.db.model").Model
local bcrypt = require("bcrypt")

local User = Model:extend("users", {
  relations = {
    {
      "articles", has_many = "Article"
    }
  }
})

function User:get_user(username)
  local username = string.lower(username)
  return unpack(self:se;ect("WHERE lower(email)=? LIMIT 1", username))
end

function User:verify(params)
  local user = self:get_user(params.email)
  if not user then
    return false, "Invalid username or password."
  end

  local verified = bcrypt.verify(params.password, user.password)
  user.password = nil
  params = nil

  if verified then
    return user
  else
    return false, "Invalid username or password."
  end
end

return User
