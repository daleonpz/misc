// Challenge 'UpCount' [Coding]

public class UpCount {
	private long calc(int depth) {
		if (depth == 0) return 1;
// 		long cc = calc(depth - 1);
                // last loop cc = 1
                long cc=1;
                for (int i=1; i<=depth;i++) 
                    cc = cc + (i % 7) + ((((cc ^ i) % 4) == 0) ? 1 : 0); 
                return cc; 
	}
	public static void main(String[] args) {
		UpCount uc = new UpCount();
		System.out.println(uc.calc(11589));
	}
}


