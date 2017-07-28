  local newstr, n, err = ngx.re.sub("hello, 1234", "([0-9])[0-9]", "[$0][$1]")
    if newstr then

    	ngx.print(newstr)
    	
        -- newstr == "hello, [12][1]34"
        -- n == 1
    else
        ngx.log(ngx.ERR, "error: ", err)
        return
    end

