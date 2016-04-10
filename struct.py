#Only certain overloads are allowed, such as NO-OBJECT ORIENTED CALLS
class Struct:
	def __init__(self):
		3
	def __getitem__(self,arg):
		return self.__dict__[arg]
	def __setitem__(self,arg,val):
		self.__dict__[arg]=val
	def __delitem__(self,arg):
		del self.__dict__[arg]
	def __getattr__(self,arg):
		return self.__dict__[arg]
	def __setattr__(self,arg,val):
		self.__dict__[arg]=val
	def __delattr__(self,arg):
		del self.__dict__[arg]
	def __pos__(*args):
		return Struct.__pos__(*args)
