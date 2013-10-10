public class MultiRead {
    public static void main(String[] args) {
        int num = minCycles("RWWRWRRWRW", 3);
        System.out.println(num);
    }
    public static int minCycles(String trave, int procs) {
        String trvb = null;
        int pr = 0, num = 0;
        for (int n=0; n < trave.length(); n++)
        {
            trvb = trave.substring(n, n+1);
            if (trvb.equals( "R")) {
                pr++;
                if(pr%procs == 1) {
                    num++;
                } else if (pr%procs == 0) {
                    pr = 0;
                }
            } else if (trvb.equals("W")) {
                pr = 0;
                num++;
            }
            trvb = null;
        }
        return num;
    }
}
