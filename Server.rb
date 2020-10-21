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
print "port to listen(default:55555): ".green
@listenport = gets.chomp
@listenport.to_i
if @listenport == ""
  @listenport = 55555
end
print "set a password for room(enter for empty) : ".light_green
password = gets
print "type you'r password one more time : ".light_green
passwordcheck = gets
if password != "" and passwordcheck != ""
  password.chomp
  passwordcheck.chomp
end
password.to_s
passwordcheck.to_s
if password != passwordcheck
  abort  "passwords do not match.".red.bold
else
  puts "Done!".green.bold
  end
startup_banner("waiting for client request...".magenta.bold)
def service(lhost, lport)
  lhost.to_s
  server = TCPServer.open(lhost, lport)# i recommend you to use http or tcp
  @client = server.accept
end
  def banner(friend)
    system ('clear')

    puts "|-----------------------------------|".red.bold
    puts "|         .CHAT WITH #{friend}.           |".light_green.bold
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
service("127.0.0.1", @listenport)
startup_banner("client connected!".yellow.bold)
print "what is your username? ".blue
username = gets.chomp
username.to_s
@client.puts(username)
friendname = @client.gets.chomp
friendname = friendname.to_s
auth = @client.gets
if auth != ""
  auth.chomp
end
auth = auth.to_s
puts auth
if auth != password
   @client.puts("password is incorrect!".red)
   abort
else
  @client.puts("Done!".light_green.bold)
end
banner(friendname.upcase)
loop{
  print ("You".green + "=> ".red)
  mymessege = gets.chomp
  mymessege.to_s
  exit(mymessege, "chat end successfully!".light_green.bold, "exit")
  @client.puts(mymessege)
  friendmesseg = @client.gets
  friendmesseg = friendmesseg.to_s
  exit(friendmesseg, "#{friendname} left.".red.bold, "")
  friendmesseg.chomp
  puts ("#{friendname}".blue + "=> #{friendmesseg}".white)
}
