require 'digest'
require 'digest/bubblebabble'

def find_md5(num_zeros)
  md5 = Digest::MD5.hexdigest("bgvyzdsv")
  num = 1

  while md5[0...num_zeros] != "0" * num_zeros
    num += 1
    md5 = Digest::MD5.hexdigest("bgvyzdsv#{num}")
  end

  puts "The md5 that begins with #{num_zeros} zeros is #{num}."
end

find_md5(5)
find_md5(6)

# 5 zeros: 254575
# 6 zeros: 1038736
