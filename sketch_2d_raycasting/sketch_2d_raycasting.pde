int[][] world=new int[15][15];
float blockSize=0;
void setup(){
size(500,500);
blockSize=min(width/world.length,height/world[0].length);
noStroke();
}
float res=3600;
void draw(){
  fill(255,255,255,10);
rect(0,0,width,height);
  for(int i=0;i<res;i++){
    if(RayHit(new PVector(mouseX,mouseY),PVector.fromAngle(radians(i*(360/res))))){
    PVector Ray=RayPos(new PVector(mouseX,mouseY),PVector.fromAngle(radians(i*(360/res))));

fill(255,0,0);
ellipse(int(Ray.x),int(Ray.y),10,10);
//line(Ray.x,Ray.y,mouseX,mouseY);
    }
}
println(frameRate);
}

void mouseReleased(){
world[int(mouseX/blockSize)][int(mouseY/blockSize)]=1;
}

boolean isInWorld(int x,int y){
return (x>=0&&y>=0&&x<world.length&&y<world[0].length);
}

boolean isHit(int x,int y){
 
if(isInWorld(int(x/blockSize),int(y/blockSize))){
  if(world[int(x/blockSize)][int(y/blockSize)]!=0){
  return true;
  }
}
  return false;
}


int maxDist=1000;
PVector RayPos(PVector pos,PVector vel){
vel.normalize();
int dist=0;
boolean hit=false;
while(dist<maxDist&&hit==false){
    pos.add(vel);
if(isHit(int(pos.x),int(pos.y))){
hit=true;
}

  dist+=1;
}

return pos;

}

boolean RayHit(PVector pos,PVector vel){
vel.normalize();
int dist=0;
boolean hit=false;
while(dist<maxDist&&hit==false){
    pos.add(vel);
if(isHit(int(pos.x),int(pos.y))){
return true;
}

  dist+=1;
}

return false;

}

float RayDist(PVector pos,PVector vel){
vel.normalize();
PVector posCopy=pos.copy();
int dist=0;
boolean hit=false;
while(dist<maxDist&&hit==false){
    pos.add(vel);
if(isHit(int(pos.x),int(pos.y))){
hit=true;
}

  dist+=1;
}

return dist(pos.x,pos.y,posCopy.x,posCopy.y);

}
