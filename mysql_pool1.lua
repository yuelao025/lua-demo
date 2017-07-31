


local mysql = require "resty.mysql"



-- local config = {
--     host = "192.168.1.247",
--     port = 3306,
--     database = "supplier",
--     user = "supplieradmim",
--     password = "7uxYbBNg"
-- }

local config = {
    host = "127.0.0.1",
    port = 3306,
    database = "blog",
    user = "root",
    password = "123456"
}


local _M = {}


function _M.new(self)
    local db, err = mysql:new()
    if not db then
        ngx.say('new error!')
        return nil
    end
    db:set_timeout(1000) -- 1 sec

    local ok, err, errno, sqlstate = db:connect(config)

    if not ok then
        return nil
    end
    db.close = close
    return db
end

local function close(self)

    ngx.say('close........')

    local sock = self.sock
    if not sock then
        return nil, "not initialized"
    end
    if self.subscribed then
        return nil, "subscribed state"
    end
    return sock:setkeepalive(10000, 200)
end

return _M


