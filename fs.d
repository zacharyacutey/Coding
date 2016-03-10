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
}
  
  
