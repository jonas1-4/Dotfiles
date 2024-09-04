-- credit: https://github.com/heygarrett/.config/blob/31a39bb88c5ed23c350349f657819107c269af12/nvim/plugin/statusline.lua
local function branch_name()
    local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
    if branch ~= "" then
        return branch .. " | "
    else
        return ""
    end
end

local function file_name()
    local path = vim.fn.expand('%')
    return path
end

local function progress()
    if vim.fn.line(".") == 1 then
        return "top"
    elseif vim.fn.line(".") == vim.fn.line("$") then
        return "bot"
    else
        local p = vim.fn.line(".") / vim.fn.line("$") * 100
        p = p % 1 >= .5 and math.ceil(p) or math.floor(p)
        return string.format("%02d", p) .. "%%"
    end
end

vim.api.nvim_create_autocmd({ "FileType", "BufEnter","FocusGained" }, {
    callback = function()
        vim.b.branch_name = branch_name()
        vim.b.file_name = file_name()
    end
})

function Status_Line()
    return " "
        .. "%<"
        .. vim.b.file_name
        .. " "
        .. "%h"
        .. "%m"
        .. "%="
        .. "%y"
        .. " "
        .. vim.b.branch_name
        .. progress()
        .. " "
end

vim.opt.statusline = "%{%v:lua.Status_Line()%}"
