local dss = require 'dss'

function Bfs (graph, func)
  local visited = {}
  local vertex_queue = dss.Queue()
  vertex_queue:insert(1)
  visited[1] = true
  while vertex_queue:is_empty() == false do
    local vertex = vertex_queue:remove()
    for k, _ in graph[vertex]:iterator() do
      if visited[k] == nil then
        vertex_queue:insert(k)
        visited[k] = true
      end
    end
    func(vertex)
  end
end

local graph = {
  [1] = dss.Set { 2, 3 },
  [2] = dss.Set { 1, 4 },
  [3] = dss.Set { 1, 4 },
  [4] = dss.Set { 2, 3, 5 },
  [5] = dss.Set { 4 },
}

Bfs(graph, print)

--[[
local set = Set { 1, 2, 3 }
for k, v in set:iterator() do
  print(k, v)
end
]]


--[[
local q = Queue()
q:insert(1)
q:insert(2)
q:insert(3)
print(q:remove(), q:remove(), q:remove(), q:remove())
]]
