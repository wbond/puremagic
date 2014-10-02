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

File type                     | Mime type
------------------------------|-------------------------------------------------
AI                            | application/pdf or application/postscript
BMP                           | image/x-ms-bmp
EPS                           | application/postscript
GIF                           | image/gif
ICO                           | application/vnd.microsoft.icon
JPEG                          | image/jpeg
JPEG 2000                     | image/jp2
PNG                           | image/png
PSD                           | image/vnd.adobe.photoshop
SVG                           | image/svg+xml
TIFF                          | image/tiff
webp                          | image/webp

### Video

File type                     | Mime type
------------------------------|-------------------------------------------------
3GP                           | video/3gpp
3GP2                          | video/3gpp2
AVI                           | video/x-msvideo
FLV                           | video/x-flv
MKV                           | video/x-matroska
MOV                           | video/quicktime
MP4                           | video/mp4
SWF                           | application/x-shockwave-flash
Theora                        | video/ogg
webm                          | video/webm
WMV                           | video/x-ms-wmv

### Audio

File type                     | Mime type
------------------------------|-------------------------------------------------
AIFF                          | audio/x-aiff
FLAC                          | audio/x-flac
M4A                           | audio/mp4
MKA                           | audio/x-matroska
MP3                           | audio/mpeg
Ogg Vorbis                    | audio/vorbis
Opus                          | audio/ogg
WAV                           | audio/x-wav
webm                          | audio/webm
WMA                           | audio/x-ms-wma

### Archives

File type                     | Mime type
------------------------------|-------------------------------------------------
7zip                          | application/x-7z-compressed
Bzip2                         | application/x-bzip2
Compress                      | application/x-compress
Gzip                          | application/x-gzip
Rar                           | application/x-rar-compressed
Tar                           | application/x-tar
xz                            | application/x-xz 
zip                           | application/zip

### Office Documents

File type                     | Mime type
------------------------------|-------------------------------------------------
Excel (`.xls`, `.xlsx`)       | application/vnd.ms-excel
Keynote                       | application/vnd.apple.keynote
Numbers                       | application/vnd.apple.numbers
OpenOffice `.odp`             | application/vnd.oasis.opendocument.presentation
OpenOffice `.ods`             | application/vnd.oasis.opendocument.spreadsheet
OpenOffice `.odt`             | application/vnd.oasis.opendocument.text
Pages                         | application/vnd.apple.pages
PDF                           | application/pdf
Powerpoint (`.ppt`, `.pptx`)  | application/vnd.ms-powerpoint
Word (`.doc`, `.docx`)        | application/msword

### Text

File type                     | Mime type
------------------------------|-------------------------------------------------
XML                           | application/xml
CSV                           | text/csv
HTML                          | text/html
RSS                           | application/rss+xml
RTF                           | text/rtf
`.tab`                        | text/tab-separated-values
XHTML                         | application/xhtml+xml
Unrecognized Text             | text/plain

### Scripts

File type                     | Mime type
------------------------------|-------------------------------------------------
Bash/Bourne                   | text/x-shellscript
Perl                          | application/x-perl
PHP                           | application/x-httpd-php
Python                        | application/x-python
Ruby                          | application/x-ruby

### Binaries

File type                     | Mime type
------------------------------|-------------------------------------------------
DLL                           | application/x-msdownload
Unrecognized Binary           | application/octet-stream


## Running Tests

```bash
lua tests.lua
```

or

```bash
luajit tests.lua
```
