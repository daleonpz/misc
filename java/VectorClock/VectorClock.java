package fhdo.timeTest;


public class VectorClock {
	@SuppressWarnings("unused")
	private int[] v;
	int myId;
	int N;

	public synchronized int[] getV() {
		// return vector clock
		return null;
	}

	public VectorClock(final int numProc, final int id) {
		// initiate parameters
	}

	public void tick() {
		// increment vc at myID
	}

	public void sendAction() {
		// increment vc at myID
	}

	public void receiveAction(final int[] sentValue) {
		// merge own vc and received vc
		// increment vc at myID
	}


	public String printvc() {
		// write vc into console
		return null;
	}
}