class FSFile:
  def __init__(self):
    self.text=""
  def ReadText(self):
    return self.txt
  def WriteText(self,new):
    self.text=new

class FSFolder:
  def __init__(self):
    self.contents={'.':self}
  def ReadFile(self,item):
    return self.contents[item].ReadText()
  def WriteFile(self,item,val):
    return self.contents[item].WriteText(val)
  def TouchFile(self,item):
    return self.contents[item]=FSFile()
  def DelFile(self,item):
    del self.contents[item]
  def GetFolder(self,item):
    return self.contents[item]
  def TouchFolder(self,item):
    self.contents[item]=FSFolder()
  def DelFolder(self,item):
    del self.contents[item]
