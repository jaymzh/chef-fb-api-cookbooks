#!/usr/bin/ruby

# A script that will extra metadata from a Chef Cookbook metadata file
# and print it. It prints it out on a single line, with no newline,
# space-separated for use in a shell variable.

def usage
  puts 'Usage: cookbook_md_extract <md_item> <metadata_file>'
  puts
  puts "  <md_item> is a field such as 'depends' or 'license'"
  puts '  <metadata_file> is the path to a metadata file'
end

def usage_error
  usage
  exit 1
end

what = ARGV.shift
md = ARGV.shift

usage_error unless what && md

# Rather than try to define every method in the metadata file, we'll just
# ignore method_missing and then define the one we care about
#
# we massage $VERBOSE to avoid the ruby errors about method_missing
#
# rubocop:disable Style/MethodMissing, Style/MissingRespondToMissing
old_verbose = $VERBOSE
$VERBOSE = nil
def method_missing(*keys); end
$VERBOSE = old_verbose
# rubocop:enable Style/MethodMissing, Style/MissingRespondToMissing

# define the method the user cares about
define_method(what) do |*args|
  args.each do |arg|
    print arg, ' '
  end
end

# grab only the lines that call our method
lines = []
File.readlines(md).each do |line|
  next unless line.match?(/#{what}/)
  lines << line
end

# eval the lines we grabbed
# rubocop:disable Security/Eval
eval(lines.join("\n"))
# rubocop:enable Security/Eval
