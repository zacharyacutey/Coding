import std.stdio,std.random,std.conv;
string vowel(string arg)
{
	return arg[0]=='A' || arg[0]=='E' || arg[0] == 'I' || arg[0]=='O' || arg[0]=='U'  ? "n" : "";
}
int gen(int x,int y)
{
	return uniform(x,y + 1);
}
void death()
{
	"You have died!".write;
	while(true)
	{
	}
}
string getline()
{
	return readln[0..$-1];
}
void info(int health,int def,int m,int whealth)
{
	"-------Combat-------".writeln;
	"B-Big slash: 15-50 damage, 25% chance of missing.".writeln;
	"D-Dodge: 75% chance of dodging all damage.".writeln;
	"M-Medkit: Restores you to full health.".writeln;
	"--------------------".writeln;
	"Health: ".write;
	health.writeln;
	"def: ".write;
	def.writeln;
	"Medkits: ".write;
	m.writeln;
	"Enemy Health: ".write;
	whealth.writeln;
	"Command: ".write;
}
void boss(ref int health,int def,ref int m)
{
	int g,c,chance,damage,charge,t,whealth=1000,f,stun;
	while(health>0 && whealth>0)
	{
		string att;
		if(stun==0)
		{
			info(health,def,m,whealth);
			att=getline;
			if(att=="b"||att=="B")
			{
				writeln;
				"Big Slash!".writeln;
				chance=gen(1,4);
				f=0;
				if(chance==1)
					"Dodged!".writeln;
				else
					whealth-=gen(15,50);
			}
			else if(att=="q"||att=="Q")
			{
				writeln;
				"Quick Slash!".writeln;
				chance=gen(1,20);
				f=0;
				if(chance==1)
					"Dodged!".writeln;
				else
					whealth-=gen(5,15);
			}
			else if(att=="d"||att=="D")
			{
				writeln;
				"Dodge!".writeln;
				chance=gen(1,4);
				f=0;
				if(chance==1||chance==2||chance==3)
				{
					f=1;
					"Success".writeln;
					charge++;
				}
				else
					"Failed.".writeln;
			}
			else if(att=="m"||att=="M")
			{
				writeln;
				"Used a medkit.".writeln;
				m--;
				health=1000;
				f=0;
			}
			else
			{
				"Not a valid command!".writeln;
				f=1;
			}
			writeln;
		}
		else
		{
			info(health,def,m,whealth);
			att=getline;
			"###############".writeln;
			"You are stunned!".writeln;
			"###############".writeln; //Line 90
		}
		stun=0;
		damage=0;
		if(f==0)
		{
			if(charge==0)
			{
				"The Destroyer Attacks!".writeln; //97
				damage=gen(20,100)-def;
				if(def>=damage)
				{
					if(f==1) "Your armor blocked the damage!".writeln;
					damage=0; //useless, LOL
				}
				health-=damage;
				chance=gen(1,3);
				if(chance==2)
					charge++;
			}
			else if(charge==1)
			{
				"The Destroyer is charging up for a heavy attack!".writeln;
				charge++;
			}
			else
			{
				stun=1;
				"The Destroyer Charges!".writeln;
				"You have been stunned!".writeln;
				damage=gen(25,200)-def;
				if(def>=damage)
				{
					if (f==1) "Your armor blocked the damage!".writeln;
					damage=0;
				}
				else
				{
					health-=damage;
					charge=0;
				}
			}
		}
		g=0;
		"You took ".write;
		damage.write;
		" damage!".writeln;
		f=0;
		if(health<1)
			death;
		while(whealth<1)
			"#Congrats! You won!".write;
	}
}
//Line 152, combat function
void combat(int z,ref int num,ref int health,ref int def,ref int m)
{
	int j=gen(1,3);
	string monster;
	if(z==4)
	{
		if(j==3)
			monster="Bandit";
		else if(j==2)
			monster="Wyvern";
		else
			monster="Giant Snake";
		int g,c,chance,damage,charge,whealth=gen(100,200),t,f; //Line 169
		"Something approaches".writeln;
		writeln("A" ~ monster.vowel ~ " " ~ monster ~ "jumps out!"); //Line 170
		while(c==0)
		{
			string att;
			info(health,def,m,whealth);
			if(t==0)
			{
				att=getline; //Line 179
				if(att=="b"||att=="B")
				{
					writeln;
					"Big Slash!".writeln;
					chance=gen(1,4);
					f=0;
					if(chance==1)
						"Dodged!".writeln;
					else
						whealth-=gen(15,50);
				}
				else if(att=="q"||att=="Q")
				{
					writeln;
					"Quick Slash!".writeln;
					chance=gen(1,20);
					f=0;
					if(chance==1)
						"Dodged!".writeln;
					else
						whealth-=gen(5,15); //Line 201
					
				}
				else if(att=="d"||att=="D")
				{
					writeln;
					"Dodge!".writeln;
					chance=gen(1,4);
					f=0;
					if(chance==1||chance==2||chance==3)
					{
						f=1;
						"Success".writeln;
					}
					else
						"Failed.".writeln; //Line 214
				}
				else if(att=="m"||att=="M")
				{
					f=1;
					if(m>0)
					{
						writeln;
						"Used a medkit.".writeln;
						m--;
						health=1000;
					}
					else
						"You have no medkits!".writeln;
				}
				else
				{
					"Not a valid command!".writeln;
					f=1; //Line 231
				}
			}
			writeln;
			damage=0;
			if(charge==0)
			{
				writeln(monster ~ " Attacks!");
				damage=gen(5,25)-def;
				if(def>=damage&&f==0)
				{
					"Your armor blocked the damage!".writeln;
					damage=0;
				}
				health-=damage;
				chance=gen(1,4);
				if(chance==1)
					charge++;
				else
					charge=0;
			}
			else if(charge==1)
			{
				writeln("The "~monster~" is charging up for a heavy attack");
				charge++;
			}
			else
			{
				writeln(monster~" Charges!");
				damage=gen(10,25)-def;
				if(def>=damage&&f==0)
				{
					"Your armor blocked the damage!".writeln;
					damage=0;
				}
				health-=damage;
				charge=0;
			}
			g=0;
			"You took ".write;
			damage.write;
			" damage!".writeln;
			if(health<1)
				death;
			if(whealth<1)
			{
				"#############".writeln;
				writeln(monster ~ " Slain!");
				"#############".writeln;
				chance=gen(1,3);
				if(chance==1)
				{
					def++;
					"You loot some armor off of thhe corpse... Defense +1".writeln;
				}
				else
				{
					m++;
					"You loot a medkit off of the corpse...".writeln;
				}
				t=1;
				c=1; //294
			}
		}
	}
	if(z==2||z==3)
	{
		if(j==3)
			monster="Giant Spider";
		else if(j==2)
			monster="Giant Scorpion";
		else
			monster="Insane Bandit";
		int g,c,chance,damage,charge,t,f,whealth=gen(200,300);
		"Something approaches...".writeln;
		writeln("A" ~ monster.vowel ~ " " ~ monster ~ " jumps out!");
		c=0;
		while(c==0)
		{
			string att;
			info(health,def,m,whealth);
			if(t==0)
			{
				att=getline; //320
				if(att=="b"||att=="B")
				{
					writeln;
					"Big Slash!".writeln;
					chance=gen(1,4);
					f=0;
					if(chance==1)
						"Dodged!".writeln;
					else
						whealth-=gen(15,50);
				}
				else if(att=="q"||att=="Q")
				{
					writeln;
					"Quick Slash".writeln;
					chance=gen(1,20);
					f=0;
					if(chance==1)
						"Dodged!".writeln;
					else
						whealth-=gen(5,15);
				}
				else if(att=="d"||att=="D")
				{
					writeln;
					"Dodge!".writeln;
					chance=gen(1,4);
					f=0;
					if(chance==1||chance==2||chance==3)
					{
						f=1;
						"Success".writeln;
					}
					else
						"Failed.".writeln;
				}
				else if(att=="m"||att=="M")
				{
					f=1;
					if(m>0)
					{
						writeln;
						"Used a medkit.".writeln;
						m--;
						health=1000;
					}
					else
						"You have no medkits!".writeln;
				}
				else
				{
					"Not a valid command!".writeln;
					f=1; //371
				}
			}
			writeln;
			damage=0;
			if(charge==0)
			{
				writeln(monster~" Attacks!");
				damage=gen(7,25)-def;
				if(def>=damage&&f==0)
				{
					"Your armor blocked the damage!".writeln;
					damage=0;
				}
				health-=damage;
				chance=gen(1,4);
				if(chance==1)
					charge++;
				else
					charge=0;
			}
			else if(charge==1)
			{
				writeln("The "~monster~" is charging up for a heavy attack!");
				charge++;
			}
			else
			{
				writeln(monster ~ " Charges!");
				damage=gen(15,135)-def;
				if(def>=damage&&f==0)
				{
					"Your armor blocked the damage".writeln;
					damage=0;
				}
				health-=damage;
				charge=0;
			}
			g=0;
			"You took ".write;
			damage.write;
			" damage!".writeln;
			if(health<1)
				death;
			if(whealth<1)
			{
				"#############".writeln;
				writeln(monster ~ " Slain!");
				"#############".writeln; //421
				chance=gen(1,3);
				if(chance==1)
				{
					def++;
					"You loot some armor off of the corpse...".writeln;
				}
				else if(chance==2||chance==3)
				{
					m++;
					"You loot a medkit off of the corpse...".writeln;
				}
				t=1;
				c=1; //435
			}
		}
	}
	if(z==1||z==0)
	{
		if(j==3)
			monster="Earth Elemental";
		else if(j==2)
			monster="Undead Bandit";
		else
			monster="Giant Mole";
		int g,c,chance,damage,charge,t,f,whealth=gen(200,300);
		"Something approaches...".writeln;
		writeln("A"~monster.vowel~" "~monster~" jumps out~");
		c=0;
		while(c==0)
		{
			string att;
			info(health,def,m,whealth);
			if(t==0)
			{
				att=getline;
				if(att=="b"||att=="B")
				{
					writeln;
					"Big Slash!".writeln;
					chance=gen(1,4);
					f=0;
					if(chance==1)
						"Dodged!".writeln;
					else
						whealth-=gen(15,50);
				}
				else if(att=="q"||att=="Q")
				{
					writeln;
					"Quick Slash!".writeln;
					chance=gen(1,20);
					f=0;
					if(chance==1)
						"Dodged!".writeln;
					else
						whealth-=gen(5,15);
				}
				else if(att=="d"||att=="D")
				{
					writeln;
					"Dodge!".writeln;
					chance=gen(1,4);
					f=0;
					if(chance==1||chance==2||chance==3)
					{
						f=1;
						"Success".writeln;
					}
					else
						"Failed.".writeln;
				}
				else if(att=="m"||att=="M")
				{
					f=1;
					if(m>0)
					{
						writeln;
						"Used a medkit.".writeln;
						m--;
						health=1000;
					}
					else
						"You have no medkits!".writeln;
				}
				else
				{
					"Not a valid command!".writeln;
					f=1;
				}
			}
			writeln;
			damage=0;
			if(charge==0)
			{
				writeln(monster ~ " Attacks!");
				damage=gen(7,25)-def;
				if(def>=damage&&f==0)
				{
					"Your armor blocked the damage!".writeln;
					damage=0;
				}
				health-=damage;
				chance=gen(1,4);
				if(chance==1)
					charge++;
				else
					charge=0;
			}
			else if(charge==1)
			{
				writeln("The "~monster~" is charging up for a heavy attack!");
				charge++;
			}
			else
			{
				writeln(monster ~ " Charges!");
				damage=gen(15,135)-def;
				if(def>=damage&&f==0)
				{
					"Your armor blocked the damage!".writeln;
					damage=0;
				}
				health-=damage;
				charge=0;
			}
			g=0;
			"You took ".write;
			damage.write;
			" damage!".writeln;
			if(health<1)
				death;
			if(whealth<1)
			{
				"#############".writeln;
				writeln(monster ~ " Slain!");
				"#############".writeln;
				chance=gen(1,3);
				if(chance==1)
				{
					def++;
					"You loot some armor off of the corpse... Defence +1".writeln;
				}
				if(chance==2||chance==3)
				{
					m++;
					"You loot a medkit off of the corpse...".writeln;
				}
				t=1;
				c=1;
			}
		}
	}
}
//At line 584!!!!! Heck Yeah!

int count(string count,char test)
{
	int x,output;
	while(x<count.length)
	{
		if(count[x]==test)
			output++;
		x++;
	}
	return output;
}

void up(ref int x,ref int y,ref int z,int h)
{
	if(h==10)
	{
		if(z!=4)
		{
			z++;
			"You climb up the stairs, but a doorway closes behind you... You are locked out!".writeln;
		}
		else
			"You jump as high as you can, but sadly you cannot fly.".writeln;
	}
	else
		"You can't go up from here".writeln;
}

void down(ref int x,ref int y,ref int z,int h)
{
	if(h==10)
	{
		if(z!=0)
		{
			z--;
			"You start to climb down, then the ground collapses underneath you!".writeln;
		}
		else
			"There are no tunnels leading down from here...".writeln;
	}
	else
		"You can't go down frrom here".writeln;
}

void north(ref int x,ref int y,ref int z)
{
	if(x!=99)
	{
		x++;
		"You trek north".writeln;
	}
	else
		"Something tells you that you can't leave the area...".writeln;
}
void south(ref int x,ref int y,ref int z)
{
	if(x!=0)
	{
		"You trek south".writeln;
		x--;
	}
	else
		"Something tells you that you can't leave the area...".writeln;
}

void east(ref int x,ref int y,ref int z)
{
	if(y!=99)
	{
		"You trek east".writeln;
		y++;
	}
	else
		"Something tells you that you can't leave the area...".writeln;
}

void west(ref int x,ref int y,ref int z)
{
	if(y!=0)
	{
		"You trek west".writeln;
		y--;
	}
	else
		"Something tells you that you can't leave the area...".writeln;
}

void command(string input,ref int x,ref int y,ref int z,ref int h,ref int health)
{
	if(input=="n"||input=="N")
		north(x,y,z);
	else if(input=="s"||input=="S")
		south(x,y,z);
	else if(input=="e"||input=="E")
		east(x,y,z);
	else if(input=="w"||input=="W")
		west(x,y,z);
	else if(input=="h"||input=="H")
	{
		"Commands:".writeln;
		"E-east".writeln;
		"W-west".writeln;
		"N-north".writeln;
		"S-South".writeln;
		"D-down".writeln;
		"U-up".writeln;
	}
	else if(input=="d"||input=="D")
		down(x,y,z,h);
	else if(input=="116728")
	{
		"X: ".write;
		x=to!int(getline);
		"Y: ".write;
		y=to!int(getline);
		"Z: ".write;
		z=to!int(getline);
		"Health: ".write;
		health=to!int(getline);
	}
	else
		"That is not a valid command, type H for help.".writeln;
}

int tile(int z,ref int num,ref int health,ref int def,ref int m)
{
	if(z==4)
	{
		if(num==1||num==3||num==12)
		{
			"[Forest]".writeln;
			return 1;
		}
		if(num==4||num==6)
		{
			"[Swamp]".writeln;
			return 4;
		}
		if(num==7||num==8||num==9)
		{
			"[Desert]".writeln;
			return 7;
		}
		if(num==10)
		{
			"[Cave Entrance]".writeln;
			return 10;
		}
		if(num==2)
		{
			combat(z,num,health,def,m);
			return 12;
		}
		if(num==5||num==15)
		{
			"[Ruins]".writeln;
			return 15;
		}
	}
	if(num==1||num==3||num==12)
	{
		"[Cavern]".writeln;
		return 1;
	}
	if(num==4||num==5||num==6)
	{
		"[Tunnel]".writeln;
		return 4;
	}
	if(num==7||num==8||num==8)
	{
		"[Cave]".writeln;
		return 7;
	}
	if(num==10)
	{
		"[Stairway]".writeln;
		return 10;
	}
	if(num==2)
	{
		combat(z,num,health,def,m);
		return 12;
	}
	if(num==11)
	{
		"A feeling of hopelessness overwhelms you...".writeln;
		"-----BOSS FIGHT-----".writeln;
		boss(health,def,m);
	}
	assert(0);
}
void main()
{
	string com,pause;
	int x,y,z,death_,def,num,m;
	int map[100][100][5];
	"Generating Map...".writeln;
	while(x<100)
	{
		while(y<100)
		{
			while(z<5)
			{
				num=gen(1,10);
				map[x][y][z]=num;
				z++;
			}
			y++;
			z=0;
		}
		x++;
		y=0;
	}
	map[99][99][0]=11;
	x=0;
	y=0;
	z=4;
	writeln;
	"This is the translated version of a text adventure by Alex Trahan, translated by Zachary Taylor.".writeln;
	"Defeat the Boss at (99,99,0) to win!".writeln;
	"Hit any key to continue.".writeln;
	pause=getline;
	int health=1000,l;
	while(true)
	{
		num=map[x][y][z];
		map[x][y][z]=tile(z,num,health,def,m);
		"Coordinates: (".write;
		x.write;
		", ".write;
		y.write;
		", ".write;
		z.write;
		")".writeln; //841
		"Command: ".write;
		com=getline;
		writeln;
		writeln;
		"---------------------------------------------------------------------------".writeln;
		command(com,x,y,z,num,health);
		"---------------------------------------------------------------------------".writeln;
	}
}
