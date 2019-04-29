# lua-templateprocessor

**A small script to process the combination of a template file and a data file and write out the resulting file**

## Usage

```bash
lua tp.lua path/to/template.txt path/to/datafile.lua path/to/outputfile.txt
```

### Datafile

```lua
data = {
    title = 'Installation procedure',
    month = 'April',
    year = '2019',
    server = 'example.com'
}
```

### Template

```
# {{title}}

Date: {{month}} {{year}}. Server: *{{server}}*
```

#### Placeholders

Placeholders must be enclosed with two curly brackets. Currently there are no
blanks inside allowed. The only special char allowed is the underscore (_).

### Output

```markdown
# Installation procedure

Date: April 2019. Server: *example.com*
```
