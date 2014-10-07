local puremagic = require('puremagic')


local successful = 0
local run = 0


function test_file(name, mimetype)
    local path = './test_files/' .. name
    local inspected_mimetype = puremagic.via_path(path)
    if inspected_mimetype ~= mimetype then
        print('\x1B[31mERROR\x1B[0m ' .. path .. ' detected as ' .. inspected_mimetype .. ' instead of ' .. mimetype)
    else
        print('\x1B[32mOK\x1B[0m ' .. path .. ' detected as ' .. inspected_mimetype)
        successful = successful + 1
    end
    run = run + 1
end


test_file('test.3gp',         'video/3gpp')
test_file('test.7z',          'application/x-7z-compressed')
test_file('test.ai',          'application/pdf')
test_file('test.aiff',        'audio/x-aiff')
test_file('test.avi',         'video/x-msvideo')
test_file('test.bmp',         'image/x-ms-bmp')
test_file('test.csv',         'text/csv')
test_file('test.doc',         'application/msword')
test_file('test.docx',        'application/msword')
test_file('test.eps',         'application/postscript')
test_file('test.flac',        'audio/x-flac')
test_file('test.flv',         'video/x-flv')
test_file('test.gif',         'image/gif')
test_file('test.html',        'text/html')
test_file('test.ico',         'application/vnd.microsoft.icon')
test_file('test.jp2',         'image/jp2')
test_file('test.jpg',         'image/jpeg')
test_file('test.key.zip',     'application/vnd.apple.keynote')
test_file('test.log',         'text/plain')
test_file('test.m4a',         'audio/mp4')
test_file('test.mka',         'audio/x-matroska')
test_file('test.mkv',         'video/x-matroska')
test_file('test.mov',         'video/quicktime')
test_file('test.mp3',         'audio/mpeg')
test_file('test.mp4',         'video/mp4')
test_file('test.numbers.zip', 'application/vnd.apple.numbers')
test_file('test.odp',         'application/vnd.oasis.opendocument.presentation')
test_file('test.ods',         'application/vnd.oasis.opendocument.spreadsheet')
test_file('test.odt',         'application/vnd.oasis.opendocument.text')
test_file('test.ogg',         'audio/vorbis')
test_file('test.ogv',         'video/ogg')
test_file('test.opus',        'audio/ogg')
test_file('test.pages.zip',   'application/vnd.apple.pages')
test_file('test.pdf',         'application/pdf')
test_file('test.php',         'application/x-httpd-php')
test_file('test.pl',          'application/x-perl')
test_file('test.png',         'image/png')
test_file('test.ppt',         'application/vnd.ms-powerpoint')
test_file('test.pptx',        'application/vnd.ms-powerpoint')
test_file('test.psd',         'image/vnd.adobe.photoshop')
test_file('test.py',          'application/x-python')
test_file('test.rar',         'application/x-rar-compressed')
test_file('test.rb',          'application/x-ruby')
test_file('test.rss',         'application/rss+xml')
test_file('test.rtf',         'text/rtf')
test_file('test.sh',          'text/x-shellscript')
test_file('test.svg',         'image/svg+xml')
test_file('test.swf',         'application/x-shockwave-flash')
test_file('test.tab',         'text/tab-separated-values')
test_file('test.tar',         'application/x-tar')
test_file('test.tar.gz',      'application/x-gzip')
test_file('test.tiff',        'image/tiff')
test_file('test.txt',         'text/plain')
test_file('test.txt.bz2',     'application/x-bzip2')
test_file('test.txt.gz',      'application/x-gzip')
test_file('test.txt.xz',      'application/x-xz')
test_file('test.txt.Z',       'application/x-compress')
test_file('test.wav',         'audio/x-wav')
test_file('test.webm',        'video/webm')
test_file('test-a.webm',      'audio/webm')
test_file('test.webp',        'image/webp')
test_file('test.wma',         'audio/x-ms-wma')
test_file('test.wmv',         'video/x-ms-wmv')
test_file('test.xhtml',       'application/xhtml+xml')
test_file('test.xls',         'application/vnd.ms-excel')
test_file('test.xlsx',        'application/vnd.ms-excel')
test_file('test.xml',         'application/xml')
test_file('test.zip',         'application/zip')

print()
print(successful .. ' of ' .. run .. ' successful')
if successful ~= run then
    print((run - successful) .. ' errors')
end
