import os
import string

#Enter your username and password below within double quotes
# eg. username="username" and password="password"
username="gnailll@gmail.com"
password="Kogotok_0001"

com="wget -O - https://"+username+":"+password+"@mail.google.com/mail/feed/atom --no-check-certificate"

temp=os.popen(com)
msg=temp.read()
index=string.find(msg,"<fullcount>")
index2=string.find(msg,"</fullcount>")
fc=int(msg[index+11:index2])

if fc==0:
       print "^fg(#eeeeee)^i(/home/nailll/.dzen/icons/mail.xbm) ^fg()0 new"
else:
       print "^fg(#c12121)^i(/home/nailll/.dzen/icons/mail.xbm) ^fg()"+str(fc)+" new"
