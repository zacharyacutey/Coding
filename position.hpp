//Boundless Position
class Position
{
  private:
  int x;
  int y;
  public:
  Position(int x,int y);
  Position(void);
  int GetX(void)
  {
    return this->x;
  }
  int GetY(void)
  {
    return this->y;
  }
  void left(void)
  {
    (this->x)--;
  }
  void right(void)
  {
    (this->x)++;
  }
  void up(void)
  {
    (this->y)++;
  }
  void down(void)
  {
    (this->y)--;
  }
};
Position::Position(int x,int y)
{
  this->x=x;
  this->y=y;
}
Position::Position(void)
{
  this->x=0;
  this->y=0;
}
