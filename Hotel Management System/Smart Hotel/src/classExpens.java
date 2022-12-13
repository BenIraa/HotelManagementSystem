
public class classExpens {
    int id;
    String name;
    String nature;
    float Expens;

    
    public classExpens(int id, String name, String nature, float Expens){
        this.id=id;
        this.name=name;
        this.nature=nature;
        this.Expens=Expens;

    }
    
    public int getid()
    {
        return id;
    }
    
    public String getname(){
        return name;
        }
    
    public String getnature()
    {
        return nature;
        
    }
    
    public float getexpens()
            {
                return Expens;
            }
}
