import std.stdio,std.file,std.variant;
//To do, implement saving
alias FSItem = Algebraic!(FSFile,FSFolder);
class FSFile
{
  private string val;
  this() //Starts out with a blank document
  {
  }
  public void write(string arg)
  {
    this.val=arg;
  }
  public string read()
  {
    return this.val;
  }
}
class FSFolder
{
  private FSItem[string] contents;
  this()
  {
    this.contents["."]=this;
  }
  public FSItem get(string arg)
  {
    return this.contents[arg];
  }
  public void NewFile(string arg)
  {
    this.contents[arg]=new FSFile();
  }
  public void NewFolder(string arg)
  {
    this.contents[arg]=new FSFolder();
    this.contents[arg].NewFolder("..");
    this.contents[arg][".."]=this;
  }
  public void DeleteObject(string arg)
  {
    assert(arg!=".."&&arg!=".");
    this.conents.remove(arg);
  }
}
class Walker
{
  private FSFolder cd;
  private string cwd;
  this(FSFolder cd)
  {
    this.cwd=".";
    this.cd=cd;
  }
  public void chdir(string arg)
  {
    this.cd=this.cd.contents[arg];
    this.cwd=arg;
  }
  public void DeleteObject(string arg)
  {
    this.cd.DeleteObject(arg);
  }
  public string read(string arg)
  {
    return this.cd.contents[arg].read()
  }
  public void write(string arg,string text)
  {
    this.cd.contents[arg].write(text);
  }
  public string getcwd()
  {
    return this.cwd;
  }
}
