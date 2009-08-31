import string

updatefile = open("/var/log/updates.log")

i = 0
for line in updatefile:
	index = line.find(".pkg.tar.gz")
		if index != -1:
			i = i + 1
		if i == 0:
			print "^fg(#eeeeee)^i(/home/nailll/.dzen/icons/arch.xbm) ^fg()up to date"
		else:
		    print "^fg(#eeeeee)^i(/home/nailll/.dzen/icons/arch.xbm) ^fg()available("+i+")"
