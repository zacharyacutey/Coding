class OStream:
  def __init__(self):
    pass
  def __str__(self):
    return None
  def __lshift__(self,arg):
    import sys
    sys.stdout.write(str(arg))
    return OStream()
import os
endl='\n'
cout = OStream()
cout << "Hello World" << endl << "New " << "line"
