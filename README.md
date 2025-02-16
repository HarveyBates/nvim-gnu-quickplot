## What it does?

Quickly plots functions using gnuplot from nvim. Using `<Leader>gp` it compiles the plot, then displays it and you 
can press `q` to exit back to nvim. Makes it super quick to iteratively develop graphs or check your working.

Includes some templates so all the basic graph features are already setup.

## Installation

### Setting up
```bash
git clone https://github.com/HarveyBates/nvim-gnu-quickplot
cd nvim-gnu-quickplot
chmod +x new-graph.sh
ln -s $PWD/new-graph.sh /usr/local/bin/new-graph
```

#### Add tempalte path `GRAPH_PATH` to zshrc or bashrc
*Make sure* you are in the `nvim-gnu-quickplot` directory.
```bash
echo "export GRAPH_PATH=$PWD/templates" >> ~/.zshrc
# or
echo "export GRAPH_PATH=$PWD/templates" >> ~/.bashrc
```

#### In nvim `init.lua`
```lua
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.gp",
  command = "set ft=gnuplot",
})

-- Compiles GNU plot graph and outputs errors and other messages to the status bar
local function compile_gnuplot()
  local current_file = vim.fn.expand "%:p"
  local cmd = "gnuplot " .. vim.fn.shellescape(current_file) .. " 2>&1"

  local handle = io.popen(cmd)
  if handle == nil then
    return
  end

  local result = handle:read "*all"

  handle:close()

  if result and result ~= "" then
    vim.api.nvim_err_writeln(result)
  else
    vim.api.nvim_out_write "Gnuplot executed successfully\n"
  end
end

-- Set your alernative keybinding here
vim.keymap.set("n", "<Leader>gp", compile_gnuplot, { desc = "Compile Gnuplot script" })

```
