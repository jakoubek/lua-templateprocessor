function read_file(path)
    local file = io.open(path, "r")
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end

function write_file(path, content)
    local file = io.open(path, "w")
    if not file then return nil end
    file:write(content)
    file:close()
end

print("Olis Template Processor")

local templateFile = arg[1]
local dataFile = arg[2]
local outputFile = arg[3]

-- Daten lesen
print(string.format('-      data file: %s', dataFile))
dofile(dataFile)

-- Template lesen
print(string.format('-  template file: %s', templateFile))
local fileContent = read_file(templateFile)

-- Felder ersetzen
for k, v in pairs(data) do
  key = string.format('{{%s}}', k)
  fileContent = fileContent:gsub(key, data[k])
end

if outputFile then
    print(string.format('- output to file: %s', outputFile))
    write_file(outputFile, fileContent)
else
    print(fileContent)
end

print('Done.')