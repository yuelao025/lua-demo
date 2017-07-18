local red = require "redis_pool"


ngx.say(type(red))
local instance = red:new({ip = '127.0.0.1',port = 6379})


instance:cmd('set','shein.com','shein')
instance:cmd("expire",'shein.com',5)
local data = instance:cmd('get','shein.com')
ngx.say(data)


-- local new_redis = require "redis_pool"

-- local red = new_redis:new({ip="127.0.0.1", timeout = 3000, port = 6379})

-- red:cmd("set","cur_time", ngx.time())
-- local res = red:cmd("get", "cur_time")
-- ngx.say(res)
