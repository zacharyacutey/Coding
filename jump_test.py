#Dependency on readchar or windows
try:
  from readchar import readkey as getch
except ImportError:
  from msvcrt import getch
try:
  import thread
except ImportError:
  import _thread as thread #Python 3
from time import sleep
def clear(): #Obviously clears the screen
  import os
  u=os.system("cls")
  if u==32512: #Ubuntu Error code for typing in cls
    os.system("clear")
  #Must add a powershell version for the school's blocked CMD, next year we have python so HECK YEAH!!!!!
#Constants

JUMP_H=2
FALL_T=1 #How many seconds til fall of one pixel/space/thing

#Global variables
pos=(0,0)

def ground():
  if pos[1]==0:
    return True
  return False

def bound(vec): #Returns True if they should not go that far
  if not 0<=pos[1]+vec[1]<=2:
    return True
  if not 0<=pos[0]+vec[0]<=2:
    return True
  return False


  
def jump_h(): #main jump function
  global pos
  if not ground():
    return
  temp=[0,JUMP_H]
  while bound(temp):
    temp[1]=temp[1]-1
  pos[1]+=temp[1]
  while not ground():
    sleep(FALL_H)
    pos[1]-=1

def disp_p(p):
  if pos[0]==p[0] and pos[1]=p[1]:
    return "x"
  return " "
def disp():
  clear()
  
