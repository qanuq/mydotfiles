local opt = vim.opt

opt.fileencoding = "utf-8"
opt.encoding = "utf-8"

opt.autowrite = true  -- automatically save before certain actions

opt.undofile = true    -- save undo history
opt.undolevels = 1000  -- 1000 levels for undo

opt.relativenumber = true  -- show line numbers
opt.number = true          -- show relative line numbers
opt.numberwidth = 4        -- set number column width to 4

opt.hlsearch = true    -- highlight search results
opt.incsearch = true   -- incremental search that shows results as you type
opt.ignorecase = true  -- case-insensitive search unless \c is used
opt.smartcase = true   -- case-sensitive if uppercase letters are used in search

opt.tabstop = 4         -- 4 spaces for tabs
opt.shiftwidth = 0      -- indentation width, falls back to tab stop
opt.shiftround = true   -- round indent to multiple of shift width
opt.expandtab = true    -- use spaces instead of tabs
opt.autoindent = true   -- copy indent from current line when starting a new one
opt.smartindent = true  -- smart indent :p
opt.smarttab = true     -- smart tab :p

opt.wrap = false  -- do not wrap lines

opt.cursorline = true  -- highlight the current line

opt.termguicolors = true  -- enable 24-bit RGB color in the TUI
opt.background = "dark"   -- use dark background

opt.signcolumn = "yes"  -- always show the sign column

opt.backspace = { "indent", "eol", "start" }  -- allow backspacing over indentation, EOL, and insert mode start position

opt.clipboard = { "unnamed", "unnamedplus" }  -- sync clipboard between OS and neovim

opt.splitright = true  -- Split new windows to the right
opt.splitbelow = true  -- Split new windows below

opt.swapfile = enable  -- Enable swap file

opt.mouse = "a"  -- Enable mouse in all modes

opt.breakindent = true  -- wrapped line will continue visually indented

opt.completeopt = { "menuone", "noselect" }  -- better completion experience

opt.laststatus = 2  -- Always display the status line
opt.cmdheight = 0   -- Set command height to 0
opt.ruler = true    -- Shows the cursor position (line and column number) in the status line.

opt.virtualedit = "block"  -- Allow virtual editing in visual block only

opt.shortmess = "aotTOIcCF"
-- 'a': abbreviate messages to avoid 'press enter' prompts
-- 'o': suppress 'search hit bottom, continuing at top' messages
-- 't': truncate file messages at the start if too long
-- 'T': truncate other messages in the middle if too long
-- 'O': overwrite file-written messages instead of appending
-- 'I': suppress the intro message when starting vim
-- 'c': suppress completion menu messages
-- 'C': suppress ins-completion-menu messages
-- 'F': don't give the file info when editing a file

opt.formatoptions = "tjcroqlnt/"
-- 't': auto-wrap text using 'textwidth'
-- 'j': remove comment leader when joining lines
-- 'c': auto-wrap comments using 'textwidth'
-- 'r': insert comment leader after <enter> in insert mode
-- 'o': insert comment leader after 'o' or 'o' in normal mode
-- 'q': allow formatting of comments with "gq"
-- 'l': do not break long lines in insert mode
-- 'n': recognize numbered lists when formatting text
-- 't': indent lines after <enter> based on previous line
-- '/': insert comment leader after '/' in a comment

opt.grepformat = "%f:%l:%c:%m"  -- grep format
opt.grepprg = "rg --vimgrep"    -- use 'rg' (ripgrep) for grep

opt.list = true         -- Display invisible characters
opt.listchars:append {
  eol = "¬",            -- character to show at the end of each line
  tab = "> ",           -- character to show for each tab
  lead = ".",           -- character to show for leading spaces
  trail = ".",          -- character to show for trailing spaces
  space = ".",          -- character to show for each space
  nbsp = "_",           -- character to show for non-breaking spaces
  extends = "$",        -- character to show at the end of lines that extend beyond the screen
  precedes = "^",       -- character to show at the start of lines that extend beyond the screen
}

opt.showtabline = 2  -- always show tab line

opt.backup = false      -- Disable backup file
opt.writebackup = true  -- Enable backup while writing

opt.showmode = false  -- don't show mode since a status line plugin is used
opt.confirm = true    -- ask for confirmation for certain operations (e.g., :q, :qa, :w)

opt.inccommand = "split"  -- show substitution preview in split window

opt.scrolloff = 10      -- minimum lines to keep above and below the cursor
opt.sidescrolloff = 10  -- minimum columns to keep to the left and right of the cursor

opt.wildmenu = true                        -- enable command-line completion
opt.wildmode = { "longest:full", "full" }  -- command-line completion mode
opt.wildignore = "*.swp,*.pyc,*.class,*.o,.DS_Store"
-- Ignores files matching these patterns when using command-line completion.

opt.complete = { ".", "w", "b", "u", "t", "i", "U", "kspell" }
-- "."    : current buffer
-- "w"    : buffers in other windows
-- "b"    : all buffers
-- "u"    : unloaded buffers
-- "t"    : tags
-- "i"    : current and included files
-- "U"    : buffers in other windows (excluding current buffer)
-- "kspell": suggestions from the 'spell' option (requires spell checking enabled)

opt.nrformats = ""
-- this disables all special number formats for the <c-a> and <c-x> commands.
-- without any formats set, <c-a> and <c-x> will treat the entire number as a decimal number.

vim.opt.showmatch = true          -- Briefly jump to the matching bracket if an insert is made.
vim.opt.matchpairs:append("<:>")  -- Add angle brackets as a pair of characters to match.

opt.diffopt:append({
  "iwhite",              -- ignore changes in white space during diff operations.
  "vertical",            -- use vertical splits for diff mode.
  "filler",              -- show filler lines to keep the text synchronized when lines are added or deleted.
  "internal",            -- use vim's internal diff library instead of an external diff program.
  "indent-heuristic",    -- use a heuristic to improve the diff for files with indents.
  "algorithm:histogram"  -- use the 'histogram' algorithm for diff operations.
})

opt.fillchars:append { diff = "╱" }  -- set diagonal lines in place of deleted lines in diff-mode

opt.tildeop = true  -- enables the tilde operator (~) to be used with motion commands

opt.startofline = false
-- disables automatic movement of the cursor to the start of the line for certain commands and motions.

opt.tabpagemax = 999
-- sets the maximum number of tab pages to 999.
-- this limits the number of tab pages you can have open at once.

opt.linebreak = true
-- breaks lines at convenient points, such as after spaces or other characters, instead of in the middle of words.

opt.showbreak = ">>> "
-- sets the string to be displayed at the beginning of wrapped lines.
-- in this case, it shows "+++" to indicate that a line is wrapped.

opt.undodir = vim.fn.stdpath('config') .. '/tmp/undo'
-- Specifies the directory for undo files, ensuring persistent undo history across sessions.
opt.directory = vim.fn.stdpath('config') .. '/tmp/swap'
-- Specifies the directory for swap files, which store temporary data to recover unsaved changes.
opt.backupdir = vim.fn.stdpath('config') .. '/tmp/backup'
-- Specifies the directory for backup files, used to create backup copies of files before overwriting.
