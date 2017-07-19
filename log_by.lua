



print('log by lua test !')


local t = ngx.shared.shared_data 
-- t:set('aa',1)
t:incr('aa',1)
