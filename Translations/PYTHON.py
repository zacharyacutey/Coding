import random,sys
from __future__ import division
#Utils that help alot
def write(arg):
  sys.stdout.write(arg)
def vowel(arg):
  return 'n' if arg[0]=='A' or arg[0]=='E' or arg[0]=='I' or arg[0]=='O' or arg[0]=='U' else ''
def gen(x,y):
  return random.randint(x,y)
def death():
  write("You have died!")
  while True:
    pass
def getline():
  return raw_input()
def writeln(arg):
  print(arg)
def info(health,def_,m,health):
  writeln("-------Combat-------");
	writeln("B-Big slash: 15-50 damage, 25% chance of missing.");
	writeln("D-Dodge: 75% chance of dodging all damage.");
	writeln("M-Medkit: Restores you to full health.");
	writeln("--------------------");
	write("Health: ");
	writeln(health);
	write("def: ");
	writeln(def_);
	write("Medkits: ");
	writeln(m);
	write("Enemy Health: ");
	writeln(whealth);
	write("Command: ");
def boss(health,def_,m):
  g=0
  c=0
  chance=0
  damage=0
  charge=0
  t=0
  whealth=1000
  f=0
  stun=0 #4-
