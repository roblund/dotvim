vim.opt.statusline = table.concat({
    "%#warningmsg#",
    "%*",
    "%* %<%f %*", --full path
    "%*%m%*", --modified flag
    "%*%=%5l%*", --current line
    "%*/%L%*", --total lines
    "%*:%c %*", --column in line
    "%*%y%*", --file type
})
