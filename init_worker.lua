    local delay = 3  -- in seconds
    local new_timer = ngx.timer.at
    local log = ngx.log
    local ERR = ngx.ERR
    local check

    check = function(premature)
     if not premature then
         -- do the health check or other routine work
         local ok, err = new_timer(delay, check)
         if not ok then
             log(ERR, "failed to create timer: ", err)
             return
         else
            log(ERR, "worker id : ", ngx.worker.id())

         end


     end
    end

    if ngx.worker.id() == 1  then
        local ok, err = new_timer(delay, check)
            if not ok then
             log(ERR, "failed to create timer: ", err)
            return
        end
    end



