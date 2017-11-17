package fhdo.timeTest;

import java.util.Random;

public class VCTestFrame {
	static int RUNTIMESEC = 1;
	static int RUNS = 0;
	public static Random generator = new Random();
	public static Threadsvc tvc = null;

	public static class Threadsvc {
		public Thread[] threadarray = null;
		public VectorClock[] vca = null;

		public Threadsvc() {
			// initiate arrays
			// assign thread ids, and reference them in thread array
			// create and start threads
		}
	}

	static class runa implements Runnable {
		@Override
		public void run() {
			// get ID, starttime & target
			// sleep random
			// use VC's sendAction and ReceiveActions (print VCs)
			// interrupt target thread
			// catch interrupt exception (print VC)
		}
	}

	public static void main(final String[] args) {
		// use scanner to read / set number of threads and runtime
		// create Threadsvc (constructor will start threads)
		// wait for threads to finish
	}
}
