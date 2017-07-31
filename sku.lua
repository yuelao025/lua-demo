
local  cjson = require("cjson")
local mysql_sku = require('mysql_pool1')


-- local db 
local function sku_info()

	local req = ngx.req.get_method()

	if(req == 'POST') then
		-- ngx.say(req)
		ngx.req.read_body()
		local sku_tbl = ngx.req.get_post_args()

		-- ngx.say(type(sku_tbl))
		-- local t = cjson.encode(sku_tbl)
		-- ngx.say(t.sku)
		-- ngx.say(cjson.decode(t))
		local str = ''
		for k,v in pairs(sku_tbl) do
			-- ngx.say(k)
			str = str .. '"' .. v .. '",'
		end


		-- ngx.say(str)
		-- do return end
		local newstr =  string.sub(str,1,string.len(str) -1)
		newstr = "("..newstr..")"

		-- ngx.say(newstr)

	    local db = mysql_sku:new()

	    -- ngx.say(type(db))

		local  sql =''
		if not db then
			ngx.say('db new error!')
			return
		else
			sql =  'SELECT a.* ,b.supplier_name from  sku_supplier_relation as a inner JOIN sku_supplier_sync as b on a.supplier_id = b.supplier_id and a.sku in ' ..  newstr 
			-- 一定要是 db:query(sql) 不要点！！！！否则 failed to send query: cannot send query in the current context: nil
			local res, err, errno, sqlstate  = db:query(sql)
			-- ngx.say(res,err)
			ngx.say(cjson.encode(res))
			-- ngx.log(ngx.ERR,cjson.encode(res))
		end

		-- ngx.say(sql)

	end

	if(req == 'GET') then
		ngx.say(req)
	end
end





sku_info()

