

local  cjson =  require "cjson"


local mysql = require("mysql_pool")

local instance = mysql:new()

-- 增删改查

local name = ngx.now()
local  frequency = 1
local sql  = 'insert into tbl_tag(name,frequency) values ('..name..", "..frequency..")"

ngx.say(sql)

instance:query(sql)


local id = 77
local del =  'delete from tbl_tag where id = '.. id

ngx.say(del)

instance:query(del)

local upstr = "shein.com"
local newid = 78

local  upt = "update tbl_tag set name = '"..upstr .. "' where id = ".. newid

ngx.say(upt)


instance:query(upt)


local qusql = 'select * from tbl_tag'
ngx.say(qusql)

local res, err, errno, sqlstate = instance:query(qusql)
ngx.say(type(res))

ngx.say(cjson.encode(res))

-- instance:close()










