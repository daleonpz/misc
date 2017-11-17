import java.util.Scanner;

public class E45_BankersFrame {
	private int need[][], allocate[][], max[][], avail[][], np, nr;

	private void input() {
		@SuppressWarnings("resource")
		final Scanner sc = new Scanner(System.in);
		System.out.print("Enter no. of processes and resources : ");
		this.np = sc.nextInt(); // no. of process
		this.nr = sc.nextInt(); // no. of resources
		this.need = new int[this.np][this.nr]; // initializing arrays
		this.max = new int[this.np][this.nr];
		this.allocate = new int[this.np][this.nr];
		this.avail = new int[1][this.nr];

		System.out.println("Enter allocation matrix -->");
		// TODO

		System.out.println("Enter max matrix -->");
		// TODO

		System.out.println("Enter available matrix -->");
		// TODO

		sc.close();
	}

	private int[][] calc_need() {
		// TODO

		return this.need;
	}

	private boolean check(final int i) {
		// checking if all resources for ith process can be allocated
		for (int j = 0; j < this.nr; j++) {
			if (this.avail[0][j] < this.need[i][j]) {
				return false;
			}
		}
		return true;
	}

	public void isSafe() {
		input();
		calc_need();
		final boolean done[] = new boolean[this.np];
		final int j = 0;

		while (j < this.np) { // until all process allocated
			// TODO
		}
		if (j == this.np) {
			System.out.println("\nSafely allocated");
		}
		else {
			System.out.println("All proceess cant be allocated safely");
		}
	}

	public static void main(final String[] args) {
		new E45_BankersFrame().isSafe();
	}
}