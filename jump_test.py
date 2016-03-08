#Dependency on readchar or windows
try:
  from readchar import readkey as getch
except ImportError:
  from msvcrt import getch
try:
  import thread
except ImportError:
  fro
def clear():
  import os
  u=os.system("cls")
  if u==32512: #Ubuntu Error code for typing in cls
    os.system("clear")
