
local  cjson = require("cjson")
local mysql_sku = require('mysql_pool1')


-- local db 
local function show_info()

	local req = ngx.req.get_method()

	if(req == 'GET') then
		-- ngx.say(req)
		
	    local db = mysql_sku:new()

	    -- ngx.say(type(db))

		local  sql =''
		if not db then
			ngx.say('db new error!')
			return
		else
			sql =  'SELECT * from user as u inner join comment as c on u.id = c.user_id'
			-- 一定要是 db:query(sql) 不要点！！！！否则 failed to send query: cannot send query in the current context: nil
			local res, err, errno, sqlstate  = db:query(sql)
			-- ngx.say(res,err)
			ngx.say(cjson.encode(res))
			-- ngx.log(ngx.ERR,cjson.encode(res))
		end

		-- ngx.say(sql)

	end

end





show_info()

