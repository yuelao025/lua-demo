



local t = ngx.shared.shared_data 
local count = t:get('aa')

ngx.say(count)



