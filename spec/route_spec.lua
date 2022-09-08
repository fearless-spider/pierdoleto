local request = require("lapis.spec.server").request
local use_test_server = require("lapis.spec").use_test_server

describe("Route to home page", function()
  use_test_server()

  it('should make a request', function()
    local status, body, headers = request('/')

    assert.are.same(200, status)
    assert.is.truthy(body:match('Pierdole To'))
  end)
end)
