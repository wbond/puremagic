# puremagic

A pure lua module that detects the mime type of file based on their contents. Falls back to detecting based on extension for plain text files.

Tested on Lua 5.2 and Luajit 2.0. Should work with Lua 5.1 also.

## Usage

Basic usage:

```lua
local puremagic = require('puremagic')
local mimetype = puremagic.via_path('/path/to/file')
```

When dealing with temp files, you may want to pass the original filename in case the extension is needed:

```lua
local puremagic = require('puremagic')
local mimetype = puremagic.via_path('/var/tmp/xyz', 'test.xlsx')
```

If you have the contents of the file in memory, you can provide those plus the filename:

```lua
local content = '#!/bin/bash\n'
local puremagic = require('puremagic')
local mimetype = puremagic.via_content(content, 'test.sh')
```

## Supported Mime Types

The following mime types are detected:

### Images

 - image/gif
 - image/jp2
 - image/jpeg
 - image/png
 - image/svg+xml
 - image/tiff
 - image/vnd.adobe.photoshop
 - image/webp
 - image/x-ms-bmp
 - application/postscript
 - application/vnd.microsoft.icon

### Video

 - video/3gpp
 - video/mp4
 - video/ogg
 - video/quicktime
 - video/webm
 - video/x-flv
 - video/x-matroska
 - video/x-ms-wmv
 - video/x-msvideo
 - application/x-shockwave-flash

### Audio

 - audio/mp4
 - audio/mpeg
 - audio/ogg
 - audio/vorbis
 - audio/webm
 - audio/x-aiff
 - audio/x-flac
 - audio/x-matroska
 - audio/x-ms-wma
 - audio/x-wav

### Archives

 - application/x-7z-compressed
 - application/x-bzip2
 - application/x-compress
 - application/x-gzip
 - application/x-rar-compressed
 - application/x-tar
 - application/x-xz 
 - application/zip

### Office Documents

 - application/msword
 - application/pdf
 - application/vnd.apple.keynote
 - application/vnd.apple.numbers
 - application/vnd.apple.pages
 - application/vnd.ms-excel
 - application/vnd.ms-powerpoint
 - application/vnd.oasis.opendocument.presentation
 - application/vnd.oasis.opendocument.spreadsheet
 - application/vnd.oasis.opendocument.text

### Text

 - application/xhtml+xml
 - application/xml
 - application/rss+xml
 - text/csv
 - text/html
 - text/plain
 - text/rtf
 - text/tab-separated-values

### Scripts

 - application/x-httpd-php
 - application/x-perl
 - application/x-python
 - application/x-ruby
 - text/x-shellscript

### Binaries

 - application/x-msdownload
 - application/octet-stream

## Running Tests

```bash
lua tests.lua
```

or

```bash
luajit tests.lua
```
