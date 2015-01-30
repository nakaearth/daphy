$:.unshift(File.dirname(__FILE__))

require 'fluent/configurable'
require 'fluent/config'
require 'fluent/parser'
require 'time'

# log = 'Jul 16 00:45:47 BJA login[58879]: USER_PROCESS: 58879 ttys002'
log = "'I, [2015-01-28T23:19:07.093509 #36820]  INFO -- : { 'controller': 'job_cards', 'action': 'ind    ex', 'execute_time': '2015-01-28 23:19:07 +0900' }"

#regexp = /^(?<time>\w{3} \d\d (\d{2}:){2}\d{2}) (?<host>\w+) (?<role>\w+)\[(?<pid>\d+)\]: (?<event>\w+): (?<info>\d+) (?<tty>.+)$/

regexp = "/^([.*])  INFO -- .*/" 
parser = Fluent::TextParser::RegexpParser.new(regexp)
parser.time_format = '%b %d %T'
p parser.call(log)
