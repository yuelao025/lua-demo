
local  cjson = require("cjson")
local mysql_sku = require('mysql_pool1')


-- local db 
local function show_info()

	local req = ngx.req.get_method()

	if(req == 'GET') then
		-- ngx.say(req)
		
	    local db = mysql_sku:new()

	    -- ok的
	    -- local newstr = ngx.var.arg_sku   

	    local newstr = ngx.req.get_uri_args()["sku"]


	    -- ngx.say(1,newstr)
	    -- do return end

	    -- ngx.say(type(db))

		local  sql =''
		if not db then
			ngx.say('db new error!')
			return
		else

			sql =  'SELECT a.* ,b.supplier_name from  sku_supplier_relation as a inner JOIN sku_supplier_sync as b on a.supplier_id = b.supplier_id and a.sku in ("' ..  newstr..'")' 
			-- 一定要是 db:query(sql) 不要点！！！！否则 failed to send query: cannot send query in the current context: nil
			local res, err, errno, sqlstate  = db:query(sql)
			-- ngx.say(sql,err)
			ngx.say(cjson.encode(res))


			-- sql =  'SELECT * from user as u inner join comment as c on u.id = c.user_id'
			-- -- 一定要是 db:query(sql) 不要点！！！！否则 failed to send query: cannot send query in the current context: nil
			-- local res, err, errno, sqlstate  = db:query(sql)
			-- -- ngx.say(res,err)
			-- ngx.say(cjson.encode(res))
			-- ngx.log(ngx.ERR,cjson.encode(res))
		end

		-- ngx.say(sql)

	end

end



-- local db 
local function local_info()

	local req = ngx.req.get_method()

	if(req == 'GET') then
		-- ngx.say(req)
		
	    local db = mysql_sku:new()

	    -- ok的
	    -- local newstr = ngx.var.arg_sku   

	    local newstr = ngx.req.get_uri_args()["sku"]


	    -- ngx.say(1,newstr)
	    -- do return end

	    -- ngx.say(type(db))

		local  sql =''
		if not db then
			ngx.say('db new error!')
			return
		else

			-- sql =  'SELECT a.* ,b.supplier_name from  sku_supplier_relation as a inner JOIN sku_supplier_sync as b on a.supplier_id = b.supplier_id and a.sku in ("' ..  newstr..'")' 
			-- -- 一定要是 db:query(sql) 不要点！！！！否则 failed to send query: cannot send query in the current context: nil
			-- local res, err, errno, sqlstate  = db:query(sql)
			-- -- ngx.say(sql,err)
			-- ngx.say(cjson.encode(res))

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



local_info()
-- show_info()

