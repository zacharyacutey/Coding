import std.stdio;
import std.variant; //THIS IS WHY D IS AWESOME!

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
  public string type()
  {
    return "FSFile";
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
  public string type()
  {
    return "FSFolder";
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
  public chdir(string arg)
  {
    this.cd=this.cd.contents[arg];
    this.cwd=arg;
  }
  public DeleteObject(string arg)
  {
    this.cd.DeleteObject(arg);
  }
  public read(string arg)
  {
    this.cd.contents[arg].read()
  }
  public write(string arg,string text)
  {
    this.cd.contents[arg].write(text);
  }
}
