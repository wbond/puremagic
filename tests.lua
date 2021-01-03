local puremagic = require('puremagic')


local successful = 0
local run = 0


function test_file(name, mimetype, binary)
    local path = './test_files/' .. name
    local test_success = true
    local passes, stacktrace = xpcall(function()
        local inspected_mimetype, is_binary = puremagic.via_path(path)
        if inspected_mimetype ~= mimetype then
            print('\x1B[31mERROR\x1B[0m ' .. path .. ' detected as ' .. inspected_mimetype .. ' instead of ' .. mimetype)
            test_success = false
        else
            local binary =    binary    and "binary" or "non-binary"
            local is_binary = is_binary and "binary" or "non-binary"
            if is_binary ~= binary then
                print('\x1B[31mERROR\x1B[0m ' .. path .. ' detected as ' .. is_binary .. ' instead of ' .. binary)
                test_success = false
            else
                print('\x1B[32mOK\x1B[0m ' .. path .. ' detected as ' .. inspected_mimetype)
            end
        end
    end, debug.traceback)
    if not passes then
        print('\x1B[31mERROR\x1B[0m puremagic error! (' .. path .. ', ' .. mimetype .. ', ' .. tostring(binary) .. ')\n' .. stacktrace)
        test_success = false
    end
    successful = successful + (test_success and 1 or 0)
    run = run + 1
end


test_file('test.3gp',         'video/3gpp',                                      true)
test_file('test.7z',          'application/x-7z-compressed',                     true)
test_file('test.ai',          'application/pdf',                                 true)
test_file('test.aiff',        'audio/x-aiff',                                    true)
test_file('test.avi',         'video/x-msvideo',                                 true)
test_file('test.bmp',         'image/x-ms-bmp',                                  true)
test_file('test.csv',         'text/csv',                                        false)
test_file('test.doc',         'application/msword',                              true)
test_file('test.docx',        'application/msword',                              true)
test_file('test.eps',         'application/postscript',                          true)
test_file('test.flac',        'audio/x-flac',                                    true)
test_file('test.flv',         'video/x-flv',                                     true)
test_file('test.gif',         'image/gif',                                       true)
test_file('test.html',        'text/html',                                       false)
test_file('test.ico',         'application/vnd.microsoft.icon',                  true)
test_file('test.jp2',         'image/jp2',                                       true)
test_file('test.jpg',         'image/jpeg',                                      true)
test_file('test.key.zip',     'application/vnd.apple.keynote',                   true)
test_file('test.log',         'text/plain',                                      false)
test_file('test.m4a',         'audio/mp4',                                       true)
test_file('test.mka',         'audio/x-matroska',                                true)
test_file('test.mkv',         'video/x-matroska',                                true)
test_file('test.mov',         'video/quicktime',                                 true)
test_file('test.mp3',         'audio/mpeg',                                      true)
test_file('test.mp4',         'video/mp4',                                       true)
test_file('test.numbers.zip', 'application/vnd.apple.numbers',                   true)
test_file('test.odp',         'application/vnd.oasis.opendocument.presentation', true)
test_file('test.ods',         'application/vnd.oasis.opendocument.spreadsheet',  true)
test_file('test.odt',         'application/vnd.oasis.opendocument.text',         true)
test_file('test.ogg',         'audio/vorbis',                                    true)
test_file('test.ogv',         'video/ogg',                                       true)
test_file('test.opus',        'audio/ogg',                                       true)
test_file('test.pages.zip',   'application/vnd.apple.pages',                     true)
test_file('test.pdf',         'application/pdf',                                 true)
test_file('test.php',         'application/x-httpd-php',                         false)
test_file('test.pl',          'application/x-perl',                              false)
test_file('test.png',         'image/png',                                       true)
test_file('test.ppt',         'application/vnd.ms-powerpoint',                   true)
test_file('test.pptx',        'application/vnd.ms-powerpoint',                   true)
test_file('test.psd',         'image/vnd.adobe.photoshop',                       true)
test_file('test.py',          'application/x-python',                            false)
test_file('test.rar',         'application/x-rar-compressed',                    true)
test_file('test.rb',          'application/x-ruby',                              false)
test_file('test.rss',         'application/rss+xml',                             false)
test_file('test.rtf',         'text/rtf',                                        true)
test_file('test.sh',          'text/x-shellscript',                              false)
test_file('test.svg',         'image/svg+xml',                                   false)
test_file('test.swf',         'application/x-shockwave-flash',                   true)
test_file('test.tab',         'text/tab-separated-values',                       false)
test_file('test.tar',         'application/x-tar',                               true)
test_file('test.tar.gz',      'application/x-gzip',                              true)
test_file('test.tiff',        'image/tiff',                                      true)
test_file('test.txt',         'text/plain',                                      false)
test_file('test.txt.bz2',     'application/x-bzip2',                             true)
test_file('test.txt.gz',      'application/x-gzip',                              true)
test_file('test.txt.xz',      'application/x-xz',                                true)
test_file('test.txt.Z',       'application/x-compress',                          true)
test_file('test.wav',         'audio/x-wav',                                     true)
test_file('test.webm',        'video/webm',                                      true)
test_file('test-a.webm',      'audio/webm',                                      true)
test_file('test.webp',        'image/webp',                                      true)
test_file('test.wma',         'audio/x-ms-wma',                                  true)
test_file('test.wmv',         'video/x-ms-wmv',                                  true)
test_file('test.xhtml',       'application/xhtml+xml',                           false)
test_file('test.xls',         'application/vnd.ms-excel',                        true)
test_file('test.xlsx',        'application/vnd.ms-excel',                        true)
test_file('test.xml',         'application/xml',                                 false)
test_file('test.zip',         'application/zip',                                 true)

print()
print(successful .. ' of ' .. run .. ' successful')
if successful ~= run then
    print((run - successful) .. ' errors')
end
