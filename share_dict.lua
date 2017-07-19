
local dict = ngx.shared.shared_data

dict:set('one','mmc')

local one = dict:get('one')
ngx.say(one)
