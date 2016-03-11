import std.stdio,std.random;
int rand()
{
	return uniform(0,32767);
}
string vowel(string arg)
{
	return (arg[0]=='A' || arg[0]=='E' || arg[0] == 'I' || arg[0]=='O' || arg[0]=='U' ) ? "n" : "";
}
int gen(int x,int y)
{
	return (rand() % y + x);
}
void death()
{
	write("You have died!");
	while(true)
	{
	}
}
string getline()
{
	return readln()[0..$-1];
}
void info(int health,int def,int m,int whealth)
{
	writeln("-------Combat-------");
	writeln("B-Big slash: 15-50 damage, 25% chance of missing.");
	writeln("D-Dodge: 75% chance of dodging all damage.");
	writeln("M-Medkit: Restores you to full health.");
	writeln("--------------------");
	write("Health: ");
	writeln(health);
	write("def: ");
	writeln(def);
	write("Medkits: ");
	writeln(m);
	write("Enemy Health: ");
	writeln(whealth);
	write("Command: ");
}
void boss(ref int health,int def,ref int m)
{
	int g,c=0,chance,damage,chance=0,t=0,whealth=1000,f=0,stun=0;
	while(health>0 && whealth>0)
	{
		string att;
		if(stun==0)
		{
			info(health,def,m,whealth);
			att=getline();
			if(att=="b"||att=="B")
			{
				writeln("\nBig Slash!");
				chance=gen(1,4);
				f=0;
				if(chance==1)
				{
					writeln("Dodged!");
				}
				else
				{
					whealth-=gen(15,50);
				}
			}
			else if(att=="q"||att=="Q")
			{
				writeln("\nQuick Slash!");
				chance=gen(1,20);
				f=0;
				if(chance==1)
				{
					writeln("Dodged!");
				}
				else
				{
					whealth-=gen(5,15);
				}
			}
			else if(att=="d"||att=="D")
			{
				writeln("\nDodge!");
				chance=gen(1,4);
				f=0;
				if(chance==1||chance==2||chance==3)
				{
					f=1;
					writeln("Success");
					charge++;
				}
				else
				{
					writeln("Failed.");
				}
			}
			else if(att=="m"||att=="M")
			{
				writeln("\nUsed a medkit.");
				m--;
				health=1000;
				f=0;
			}
			else
			{
				writeln("not a valid command!");
				f=1;
			}
			writeln();
		}
		else
		{
			info(health,def,m,whealth);
			att=getline();
			writeln("###############");
			writeln("You are stunned!");
			writeln("###############"); //Line 90
		}
		stun=0;
		damage=0;
		if(f==0)
		{
			if(charge==0)
			{
				writeln("The Destroyer Attacks!"); //97
				damage=gen(20,100)-def;
				if(def>=damage)
				{
					if(f==1) writeln("Your armor blocked the damage!");
					damage=0; //useless, LOL
				}
				health-=damage;
				chance=gen(1,3);
				if(channce==2)
				{
					charge++;
				}
				else
				{
					charge=0;
				}
			}
			else if(charge==1)
			{
				writeln("The Destroyer is charging up for a heavy attack!");
				charge++;
			}
			else
			{
				stun=1;
				writeln("The Destroyer Charges!");
				writeln("You have been stunned!");
				damage=gen(25,200)-def;
				if(def>=damage)
				{
					if (f==1) writeln("Your armor blocked the damage1");
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
		write("You took ");
		write(damage);
		writeln(" damage!");
		f=0;
		if(health<1)
		{
			death();
		}
		while(whealth<1)
		{
			write("#Congrats! You won!");
		}
	}
}
//Line 152, combat function
void combat(int z,ref int num,ref int health,ref int def,ref int m)
{
	int j=gen(1,3);
	string monster;
	if(z==1)
	{
		if(j==3)
		{
			monster="Bandit";
		}
		else if(j==2)
		{
			monster="Wyvern";
		}
		else
		{
			monster="Giant Snake";
		}
		int g,c=0,chance,damage,charge=0,whealth=gen(100,200),t=0,f=0; //Line 169
		writeln("Something approaches");
		writeln("A" ~ vowel(monster) ~ " " ~ monster ~ "jumps out!"); //Line 170
		while(c==0)
		{
			string att;
			info(health,def,m,whealth);
			if(t==0)
			{
				att=getline(); //Line 179
				if(att=="b"||att=="B")
				{
					writeln("\nBig Slash!");
					chance=gen(1,4);
					f=0;
					if(chance==1)
					{
						wrwiteln("Dodged!");
					}
					else
					{
						whealth-=gen(15,50);
					}
				}
				else if(att=="q"||att=="Q")
				{
					writeln("\nQuick Slash!");
					chance=gen(1,20);
					f=0;
					if(chance==1)
					{
						writeln("Dodged!");
					}
					else
					{
						whealth-=gen(5,15); //Line 201
					}
					
				}
				else if(att=="d"||att=="D")
				{
					writeln("\nDodge!");
					chance=gen(1,4);
					f=0;
					if(chance==1||chance==2||chance==3)
					{
						f=1;
						writeln("Success");
					}
					else
					{
						writeln("Failed."); //Line 214
					}
				}
				else if(att=="m"||att=="M")
				{
					f=1;
					if(m>0)
					{
						writeln("\nUsed a medkit.");
						m--;
						health=1000;
					}
					else
					{
						writeln("You have no medkits!");
					}
				}
				else
				{
					writeln("Not a valid command!");
					f=1; //Line 231
				}
			}
			writeln("");
			damage=0;
			if(charge==0)
			{
				writeln(monster ~ " Attacks!");
				damage=gen(5,25)-def;
				if(def>=damage&&f==0)
				{
					writeln("Your armor blocked the damage!");
					damage=0;
				}
				health-=damage;
				chance=gen(1,4);
				if(chance==1)
				{
					charge++;
				}
				else
				{
					charge=0;
				}
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
					writeln("Your armor blocked the damage!");
					damage=0;
				}
				health-=damage;
				charge=0;
			}
			g=0;
			write("You took ");
			write(damage);
			writeln(" damage!");
			if(health<1)
			{
				death();
			}
			if(whealth<1)
			{
				writeln("#############");
				writeln(monster ~ " Slain!");
				writeln("#############");
				chance=gen(1,3);
				if(chance==1)
				{
					def++;
					writeln("You loot some armor off of thhe corpse... Defense +1");
				}
				else
				{
					m++;
					writeln("You loot a medkit off of the corpse...");
				}
				t=1;
				c=1; //294
			}
		}
	}
	if(z==2||z==3)
	{
		if(j==3)
		{
			monster="Giant Spider";
		}
		else if(j==2)
		{
			monster="Giant Scorpion";
		}
		else
		{
			monster="Insane Bandit";
		}
		int g,c,chance,damage,charge=0,t=0,f=0,whealth=gen(200,300);
		writeln("Something approaches...");
		writeln("A" ~ vowel(monster) ~ " " ~ monster ~ " jumps out!");
		c=0;
		while(c==0)
		{
			string att;
			info(health,def,m,whealth);
			if(t==0)
			{
				att=getline(); //320
				if(att=="b"||att=="B")
				{
					writeln("\nBig Slash!");
					chance=gen(1,4);
					f=0;
					if(chance==1)
					{
						writeln("Dodged!");
					}
					else
					{
						whealth-=gen(15,50);
					}
				}
				else if(att=="q"||att=="Q")
				{
					writeln("\nQuick Slash");
					chance=gen(1,20);
					f=0;
					if(chance=="1")
					{
						writeln("Dodged!");
					}
					else
					{
						whealth-=gen(5,15);
					}
				}
				else if(att=="d"||att=="D")
				{
					writeln("\nDodge!");
					chance=gen(1,4);
					f=0;
					if(chance==1||chance==2||chance==3)
					{
						f=1;
						writeln("Success");
					}
					else
					{
						writeln("Failed.");
					}
				}
				else if(att=="m"||att=="M")
				{
					f=1;
					if(m>0)
					{
						writeln("\nUsed a medkit.");
						m--;
						health=1000;
					}
					else
					{
						writeln("You have no medkits!");
					}
				}
				else
				{
					writeln("Not a valid command!");
					f=1; //371
				}
			}
			writeln();
			damage=0;
			if(charge==0)
			{
				writeln(monster~" Attacks!");
				damage=gen(7,25)-def;
				if(def>=damage&&f==0)
				{
					writeln("Your armor blocked the damage!");
					damage=0;
				}
				health-=damage;
				chance=gen(1,4);
				if(chance==1)
				{
					charge++;
				}
				else
				{
					charge=0;
				}
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
					writeln("Your armor blocked the damage");
					damage=0;
				}
				health-=damage;
				charge=0;
			}
			g=0;
			write("You took ");
			write(damage);
			writeln(" damage!");
			if(health<1)
			{
				death();
			}
			if(whealth<1)
			{
				writeln("#############");
				writeln(monster ~ " Slain!");
				writeln("#############"); //421
				chance=gen(1,3);
				if(chance==1)
				{
					def++;
					writeln("You loot some armor off of the corpse...");
				}
				else if(chance==2||chance==3)
				{
					m++;
					writeln("You loot a medkit off of the corpse...");
				}
				t=1;
				c=1; //435
			}
		}
	}
	if(z==1||z==0)
	{
		if(j==3)
		{
			monster="Earth Elemental";
		}
		else if(j==2)
		{
			monster="Undead Bandit";
		}
		else
		{
			monster="Giant Mole";
		}
		int g,c,chance,damage,charge=0,t=0,f=0,whealth=gen(200,300);
		writeln("Something approaches...");
		writeln("A"~vowel(monster)~" "~monster~" jumps out~");
		c=0;
		while(c==0)
		{
			string att;
			info(health,def,m,whealth);
			if(t==0)
			{
				att=getline(att="b"||att="B");
				if(att=="b"||att=="B")
				{
					writeln("\nBig Slash!");
					chance=gen(1,4);
					f=0;
					if(chance==1)
					{
						writeln("Dodged!")
					}
					else
					{
						whealth-=gen(15,50);
					}
				}
				else if(att=="q"||att=="Q")
				{
					writeln("\nQuick Slash!");
					chance=gen(1,20);
					f=0;
					if(chance==1)
					{
						writeln("Dodged!");
					}
					else
					{
						whealth-=gen(5,15);
					}
				}
				else if(att=="d"||att=="D")
				{
					writeln("\nDodge!");
					chance=gen(1,4);
					f=0;
					if(chance==1||chance==2||chance==3)
					{
						f=1;
						writeln("Success");
					}
					else
					{
						writeln("Failed.");
					}
				}
				else if(att=="m"||att=="M")
				{
					f=1;
					if(m>0)
					{
						writeln("\nUsed a medkit.")
						m--;
						health=1000;
					}
					else
					{
						writeln("You have no medkits!");
					}
				}
				else
				{
					writeln("Not a valid command!");
					f=1;
				}
			}
			writeln("");
			damage=0;
			if(charge==0)
			{
				writeln(monster ~ " Attacks!");
				damage=gen(7,25)-def;
				if(def>=damage&&f==0)
				{
					writeln("Your armor blocked the damage!");
					damage=0;
				}
				health-=damage;
				chance=gen(1,4);
				if(chance==1)
				{
					charge++;
				}
				else
				{
					charge=0;
				}
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
					writeln("Your armor blocked the damage!");
					damage=0;
				}
				health-=damage;
				charge=0;
			}
			g=0;
			write("You took ");
			write(damage);
			writeln(" damage!");
			if(health<1)
			{
				death();
			}
			if(whealth<1)
			{
				writeln("#############");
				writeln(monster ~ " Slain!");
				writeln("#############");
				chance=gen(1,3);
				if(chance==1)
				{
					def++;
					writeln("You loot some armor off of the corpse... Defence +1");
				}
				if(chance==2||chance==3)
				{
					m++;
					writeln("You loot a medkit off of the corpse...");
				}
				t=1;
				c=1;
			}
		}
	}
}
//At line 584!!!!! Heck Yeah!
