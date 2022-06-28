-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- Custom Lua functions
--

-- {{{ Generate modeline
  function generateModeline()
    local commentString    = opt.commentstring:get()                   -- Get commentstring for current filetype
    local spaceIfNeeded    = ""
    local fileencoding

    -- Use UTF-8 if no fileencoding is set
    if(opt.fileencoding:get() == "") then
      fileencoding = "utf-8"
    else
      fileencoding = opt.fileencoding:get()
    end

    -- Insert space at the end of the modeline if commentstring is a blockcomment
    if(string.match(commentString, "%%s(.*)") ~= "") then
      spaceIfNeeded = " "
    end

    local modelineElements =                                           -- Settings to save inside the modeline
    {
      " vim: set",
      " fenc=" .. fileencoding,
      " ts="   .. opt.tabstop:get(),
      " sw="   .. opt.shiftwidth:get(),
      " sts="  .. opt.softtabstop:get(),
      " sr",
      " et",
      " si",
      " tw="   .. opt.textwidth:get(),
      " fdm="  .. opt.foldmethod:get(),
      " fmr="  .. opt.foldmarker:get()[1] .. "," .. opt.foldmarker:get()[2],
      ":",
      spaceIfNeeded,
    }

    local modelineConcat   = table.concat(modelineElements)            -- Concatenate the table values
    local modeline         = commentString:gsub("%%s", modelineConcat) -- Place modeline in commentstring correctly

    return modeline
  end
-- }}}

-- {{{ Insert modeline in buffer
  function insertModeline()
    local modeline    = generateModeline()                             -- Generate modeline
    local buffer      = api.nvim_win_get_buf(0)                        -- Get current buffer
    local currentLine = api.nvim_buf_get_lines(buffer, 0, 1, true)[1]  -- Get current first line to check

    if(currentLine == modeline) then
      -- if modeline exists (nothing)
    elseif(string.match(currentLine, "vim:")) then
      -- if different modeline exists
      api.nvim_buf_set_lines(0, 0, 1, true, { modeline })
      print("Changed modeline.")

    else
      -- if modeline doesn't exist
      api.nvim_buf_set_lines(0, 0, 0, true, { modeline })
      print("Inserted modeline.")
    end
  end
-- }}}

-- {{{ Clear search register
  function clearSearch()
    fn.setreg('/', {})
    print("Search cleared.")
  end
-- }}}

-- {{{ Clear all registers
  function clearAllRegisters()
    local registers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"*+'

    registers:gsub('.', function(register) -- take all chars and run them against the command
      fn.setreg(register, {})
    end)

    print("All registers have been cleared.")
  end
-- }}}

-- {{{ Clear all marks
  function clearAllMarks()
    cmd[[ delmarks! | delmarks a-zA-Z0-9 ]]

    print("All marks have been cleared.")
  end
-- }}}
