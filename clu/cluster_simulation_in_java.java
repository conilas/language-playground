import java.util.List;
import java.util.ArrayList;

public class Main
{
  public static void main(String[] args)
  {
    ListCluster<Integer> maCluster = ListCluster.create();
    ListCluster.add(maCluster, 10);
    ListCluster.add(maCluster, 30);
    ListCluster.add(maCluster, 50);
    System.out.println(ListCluster.get(maCluster, 2));
    
    //System.out.println(maCluster.get(0)); -> throws error 'cause we can't direct access it!
  }
}

//note that the public accessible methods are all public!
//we use our arraylist as our rep - it contains the actual data we are dealing
//note also that the methods now belong to the *type*, not to the object itself
//this was the initial idea from CLU back in the 70's (http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.136.3043&rep=rep1&type=pdf)
class ListCluster<T>
{
  
  private List<T> rep = new ArrayList<>();
  
  private void add(T value) {
    rep.add(value);
  }
  
  private T get(Integer index){
      return rep.get(index);
  }
  
  private ListCluster(){
  	
  }
  
  public static <T> ListCluster<T> create() {
    return new ListCluster<T>();
  }
  
  public static <T> void add(ListCluster<T> self, T value) {
  	self.add(value);
  }
  
  public static <T> T get(ListCluster<T> self, Integer index){
      return self.get(index);
  }
}

