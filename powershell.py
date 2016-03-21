_title="Python 3.5 (32-bit)"
def title(arg):
	import os,subprocess,sys
	global _title
	_title=arg
	t=os.getcwd()
	os.chdir("C:\\Windows\\System32")
	subprocess.run("powershell $host.UI.RawUI.WindowTitle='"+arg+"';",stdout=sys.stdout,stderr=sys.stderr)
	os.chdir(t)
def clear():
	import os,subprocess,sys
	t=os.getcwd()
	os.chdir("C:\\Windows\\System32")
	subprocess.run("powershell cls",stdout=sys.stdout,stderr=sys.stderr)
	title(_title)
	os.chdir(t)
def color(bg="Black",fg="Gray"):
	import os,subprocess,sys
	t=os.getcwd()
	os.chdir("C:\\Windows\\System32")
	subprocess.run("powershell $host.UI.RawUI.BackgroundColor='"+bg+"';",stdout=sys.stdout,stderr=sys.stderr)
	subprocess.run("powershell $host.UI.RawUI.ForegroundColor='"+fg+"';",stdout=sys.stdout,stderr=sys.stderr)
	title(_title)
	os.chdir(t)
