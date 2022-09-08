local request = require("lapis.spec.server").request
local mock_request = require("lapis.spec.request").mock_request
local use_test_env = require("lapis.spec").use_test_env
local use_test_server = require("lapis.spec").use_test_server
local lapis = require("lapis.application")

local app = require("app")
app:match("/", function(self)
  return "welcome to my page"
end)

describe("Route to home page", function()
  --use_test_server()

  it('should make a request', function()
    local status, body, headers = mock_request(app, '/')

    assert.are.same(200, status)
    assert.is.truthy(body:match('Pierdole To'))
  end)
end)
