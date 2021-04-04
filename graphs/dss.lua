local M = {}

  function M.Queue ()
    local queue = {
      first = 0,
      last = -1,
      items = {},
    }

    function queue.insert (self, item)
      self.last = self.last + 1
      self.items[self.last] = item
    end

    function queue.remove (self)
      local ret = self.items[self.first]
      if ret ~= nil then
        self.first = self.first + 1
      end
      return ret
    end

    function queue.is_empty (self)
      return self.items[self.first] == nil
    end

    return queue
  end

  function M.Set (list)
    local set = {
      items = {}
    }

    if list ~= nil then
      for _, i in ipairs(list) do
        set.items[i] = true
      end
    end

    function set.insert(self, item)
      self.items[item] = true
    end

    function set.remove (self, item)
      self.items[item] = nil
    end

    function set.contains (self, item)
      return self.items[item] or false
    end

    function set.iterator (self)
      return pairs(self.items)
    end

    return set
  end

return M
