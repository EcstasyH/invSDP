real N,n,x,y,z,s;
@pre(1>=0);
n = 0;   
x = 0;   
y = 1;   
z = 6;
while(1>=0, ( ((z == [(n),1]) and (y==[(n),2])) and (x==[(n),3]) ) )
{
        n = (n + 1);
        //x = ([(x,y),2]);
        x = (x + y);
        //y = ([(y,z),2]);
        y = (y + z);
        //z = ([(z),1]);
        z = (z + 6);
}
@post(1>=0);