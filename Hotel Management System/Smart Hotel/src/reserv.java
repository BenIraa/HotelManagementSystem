
public class reserv {
    private int id;
    private String name;
    private long phone;
    private String roomtype;
    private int roomno;
    
    public reserv(int id, String name, long phone, String roomtype, int roomno)
    {
        this.id=id;
        this.name=name;
        this.phone=phone;
        this.roomtype=roomtype;
        this.roomno=roomno;
    }
    
    public int getid()
    {
        return id;
    }
    
    public String getname()
    {
        return name;
    }
    
     public long getphone()
    {
        return phone;
    }
     public String getroomtype()
    {
        return roomtype;
    }
    public int getroomno()
    {
        return roomno;
    }
    
}
