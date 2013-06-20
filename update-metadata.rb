#!/usr/bin/ruby

Dir.entries('cookbooks').each { |cookbook|
  system("knife cookbook metadata #{cookbook} -o cookbooks/")
}