require 'digest'
require 'digest/bubblebabble'

md5 = Digest::MD5.hexdigest("bgvyzdsv")
num = 1

while md5[0...5] != "00000"
  num += 1
  md5 = Digest::MD5.hexdigest("bgvyzdsv#{num}")
end

puts num
