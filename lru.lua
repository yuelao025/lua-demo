

local lru = require 'resty.lrucache'

local lru_instance = lru.new(200)


lru_instance:set('two',{url = 'shein.com'})

lru_instance:get('two')

-- lru_instance:delete('two')


local tmp =  lru_instance:get('two')



lru_instance:set('three','mmc_',0.001)

-- ngx.sleep(0.1)

local th = lru_instance:get('three')

ngx.say(th)


ngx.say(type(tmp))
