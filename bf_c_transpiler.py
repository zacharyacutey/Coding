def instruction(arg):
  if arg=="+":
    return "++p;"
  if arg=="-":
    return "--p;"
  if arg=="<":
    return "--*p;"
  if arg==">":
    return "++*p;"
  if arg=="[":
    return "while(*p){"
  if arg=="]":
    return "}"
  if arg==".":
    return "putchar(*p);"
  if arg==",":
    return "*p=getchar();"
  return ""
INIT="#include <stdio.h>\nint main(){char *p;"
END="}"
def transpiler(arg):
  return INIT+"".join([instruction(i) for i in arg])+END
def transpile(name):
  f=open(name)
  g=open(name+".c","w")
  g.write(transpiler(f.read()))
if __name__=="__main__":
  import sys
  transpile(sys.argv[1])
