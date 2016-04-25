#Used for POS list-makers of corpora
class AppendDict:
  def __init__(self):
    self.val={}
  def __getitem__(self,key):
    if key not in self.val.keys():
      raise KeyError
    elif len(self.val[key]) == 1:
      return self.val[key][0]
    else:
      return self.val[key]
  def __setitem__(self,key,value):
    if key in self.val.keys():
      if value in self.val[key]:
        0 #do nothing
      else:
        self.val[key]+=tuple([value])
    else:
      self.val[key]=tuple([value])
  def __delitem__(self,key):
    del self.val[key]
  def __iter__(self):
    return self.val.__iter__()
  def __contains__(self,item):
    return item in self.val
def ScanCorpus(arg): #Format is [(word,part),...]
	t=AppendDict()
	for i in arg:
		if i[1]!="NAME":
			j=i[0].lower()
		else:
			j=i[0][0].upper()+i[0][1:].lower()
		t[j]=i[1]
	return t
