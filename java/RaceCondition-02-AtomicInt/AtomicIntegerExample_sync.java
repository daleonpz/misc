import java.util.concurrent.atomic.AtomicInteger;

public class AtomicIntegerExample_sync{

	static AtomicInteger at = new AtomicInteger(0);

	static class MyRunnable implements Runnable {
		private int myCounter;
		private int myPrevCounter;
		private int myCounterPlusFive;
		private boolean isNine;

		@Override
		public void run() {
            // The lock is associated with the object "at"
            synchronized (at){
                this.myCounter = at.incrementAndGet();
                System.out.println("Thread " + Thread.currentThread().getId() 
                        + " / Counter : " + this.myCounter);

                this.myPrevCounter = at.getAndIncrement();
                System.out.println("Thread " + Thread.currentThread().getId() 
                        + " / Previous : " + this.myPrevCounter);

                this.myCounterPlusFive = at.addAndGet(5);
                System.out.println("Thread " + Thread.currentThread().getId()
                        + " / plus five : " + this.myCounterPlusFive);

                this.isNine = at.compareAndSet(9, 3);
                if (this.isNine) {
                    System.out.println("Thread "
                            + Thread.currentThread().getId()
                            + " / Value was equal to 9, so it was updated to "
                            + at.intValue());
                }
            }

			System.out.println("Thread "
                    + Thread.currentThread().getId()
                    + " end.");

		}
	}

	public static void main(final String[] args) {
		final Thread t1 = new Thread(new MyRunnable());
		final Thread t2 = new Thread(new MyRunnable());
		t1.start();
		t2.start();
	}

}
