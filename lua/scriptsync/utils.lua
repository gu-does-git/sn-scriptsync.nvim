local set_timeout = function(timeout, callback)
  local timer = vim.loop.new_timer()
  local function ontimeout()
    vim.loop.timer_stop(timer)
    vim.loop.close(timer)
    callback()
  end

  vim.loop.timer_start(timer, timeout, 0, ontimeout)
  return timer
end

return {
  set_timeout = set_timeout
}
