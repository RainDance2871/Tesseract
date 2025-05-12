--load mod files
local filenames = NFS.getDirectoryItems(SMODS.current_mod.path .. 'jokers')
for i = 1, #filenames do
    local file, exception = SMODS.load_file('jokers/' .. filenames[i])
    if exception then
        error(exception)
    end
    file()
end

SMODS.Atlas {
    key = "T.Jokers",
    path = "Jokers.png",
    px = 71,
    py = 95,
}

--jokerdisplay support
local filesystem = NFS or love.filesystem
if _G["JokerDisplay"] then
  filesystem.load(SMODS.current_mod.path..'jokerdisplay.lua')()
end