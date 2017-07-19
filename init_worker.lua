    local delay = 0  -- in seconds
    local new_timer = ngx.timer.at
    local log = ngx.log
    local ERR = ngx.ERR
    local check

    check = function(premature)
     if not premature then
         -- do the health check or other routine work

         -- donot loop !! 
         -- local ok, err = new_timer(delay, check)
         -- if not ok then
         --     log(ERR, "failed to create timer: ", err)
         --     return
         -- else
         --    log(ERR, "worker id : ", ngx.worker.id())

         -- end

        log(ERR, "worker id : ", ngx.worker.id())


     end
    end


    new_timer(delay, check)

    -- if ngx.worker.id() == 1  then
    --     local ok, err = new_timer(delay, check)
    --         if not ok then
    --          log(ERR, "failed to create timer: ", err)
    --         return
    --     end
    -- end



