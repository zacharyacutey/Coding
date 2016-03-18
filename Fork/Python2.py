import thread
def f():
  print "Fork"
  thread.start_new_thread(f,tuple())
  thread.start_new_thread(f,tuple())
f()
