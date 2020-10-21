#!/usr/bin/ruby
require 'socket'
require 'colorize'
def startup_banner(waiting)
  system('clear')
puts "
▄    ▄ ▄▄▄▄▄▄ ▄▄   ▄ ▄▄▄▄▄▄          ▄▄▄  ▄    ▄   ▄▄  ▄▄▄▄▄▄▄
██  ██ █      █▀▄  █     █▀        ▄▀   ▀ █    █   ██     █
█ ██ █ █▄▄▄▄▄ █ █▄ █   ▄█          █      █▄▄▄▄█  █  █    █
█ ▀▀ █ █      █  █ █  ▄▀           █      █    █  █▄▄█    █
█    █ █▄▄▄▄▄ █   ██ ██▄▄▄▄         ▀▄▄▄▀ █    █ █    █   █
                                                             ".red.bold
puts waiting
end
startup_banner("
  coded by ☢POLARSPETROLL☢
  GITHUB : github.com/polarspetroll
  INSTAGRAM : @polarspetroll

  ".light_cyan.bold)

print ("server address(default is localhost) : ")
@srvaddr = gets.chomp
@srvaddr.to_s
print ("server port(defaut is 55555) : ")
@srvport = gets.chomp
@srvport.to_i
if @srvport == "" or @srvport == 0
  @srvport = 55555
end
if @srvaddr == "" or "0.0.0.0"
  @srvaddr = "127.0.0.1"
end
def service(lhost, lport)
  @server = TCPSocket.open(lhost, lport) # i recommend you to use http or tcp
end
def banner(friend)
  system ('clear')
  puts "|-----------------------------------|".red.bold
  puts "|         .CHAT WITH #{friend}.         |".light_green.bold
  puts "|                                   |".light_yellow.bold
  puts "|        exit : end the chat        |".light_cyan.bold
  puts "|___________________________________|".light_magenta.bold
end
def exit(command, output, returns)
if command == returns
  system('clear')
    abort output
  end
end
def waiting(seconds,fps=8)
  chars = %w[| / - \\]
  delay = 0.7/fps
  (seconds*fps).round.times{ |i|
    print chars[i % chars.length].magenta
    sleep delay
    print "\b"
  }
end
service(@srvaddr, @srvport)
startup_banner("connected , waiting for server respond...".blue)
friendname = @server.gets.chomp
friendname = friendname.to_s
startup_banner("#{friendname} Joined".yellow)
print "what is your username? ".blue
username = gets.chomp
username.to_s
@server.puts(username)
  print "password for chat(enter for empty) : ".light_green
  password = gets.chomp
  password.to_s
  @server.puts(password)
  authreply = @server.gets.chomp
  authreply = authreply.to_s
  puts authreply
  waiting(3)
banner(friendname.upcase)
loop{
  friendmesseg = @server.gets
  friendmesseg = friendmesseg.to_s
  exit(friendmesseg, "#{friendname} left.".red.bold, "")
  puts ("#{friendname}".blue + "=> #{friendmesseg}".white)
  friendmesseg.chomp
  print ("You".green + "=> ".red)
  mymessege = gets.chomp
  mymessege.to_s
  exit(mymessege, "chat end successfully!".light_green.bold, "exit")
  @server.puts(mymessege)

}
