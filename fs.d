import std.stdio;
class FSFile
{
  private string val;
  this(string arg)
  {
    this.val=arg;
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
