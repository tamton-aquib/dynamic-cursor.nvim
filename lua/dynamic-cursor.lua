M = {}
local highlighter = require "vim.treesitter.highlighter"
local ts_utils = require "nvim-treesitter.ts_utils"

local function get_treesitter_hl()
	local buf = vim.api.nvim_get_current_buf()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	row = row - 1

	local self = highlighter.active[buf]
	if not self then return {} end

	local matches = {}

	self.tree:for_each_tree(function(tstree, tree)
		if not tstree then
			return
		end

		local root = tstree:root()
		local root_start_row, _, root_end_row, _ = root:range()

		if root_start_row > row or root_end_row < row then
			return
		end

		local query = self:get_query(tree:lang())

		if not query:query() then
			return
		end

		local iter = query:query():iter_captures(root, self.bufnr, row, row + 1)

		for capture, node, _ in iter do
			local hl = query.hl_cache[capture]

			if hl and ts_utils.is_in_node_range(node, row, col) then
				local c = query._query.captures[capture] -- name of the capture in the query
				if c ~= nil then
					local general_hl = query:_get_hl_from_capture(capture)
					table.insert(matches, general_hl)
				end
			end
		end
	end, true)
	return matches
end

function M.noice()
	local ts_hi = get_treesitter_hl()
	local final = #ts_hi >= 1 and ts_hi[#ts_hi]
	if type(final) ~= "string" then final = "Normal" end

	local hl = vim.api.nvim_get_hl_by_name(final, true)
	local color = string.format("#%x", hl['foreground'] or 0)

	vim.cmd('hi DynamicCursor guifg='..color..' guibg='..color)
end

function M.setup(opts)
  opts = opts or {}
	vim.opt.guicursor= opts.guicursor or "n-v-c:block-DynamicCursor,i:ver100-DynamicCursor"
	vim.cmd [[au CursorMoved * lua require"dynamic-cursor".noice()]]
end

return M
