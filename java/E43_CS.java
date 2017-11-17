import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;


public class E43_CS {
	static int i = 0;
	static VolatileData vd = new VolatileData();
	static AtomicInteger ai = new AtomicInteger(0);
	static Lock mutex = new ReentrantLock();

	synchronized static void inciSynchronized() {
		i++;
	}

	static void inciMutex() {
		mutex.lock();
		i++;
		mutex.unlock();
	}

	public static class VolatileData {
		private volatile int counter = 0;
		AtomicInteger ai = new AtomicInteger(0);

		// prevents caching! but not atomic!
		public VolatileData() {
			this.counter = 0;
		}

		public int getCounter() {
			return this.counter;
		}

		public void increaseCounter() {
			++this.counter;
			this.ai.incrementAndGet();
			// not atomic! if two threads increment, counter might not be +=2
			// but +=1;
		}
	}

	static class MyRunnableM implements Runnable {

		@Override
		public void run() {
			for (int c = 0; c < 10000; c++) {
				inciMutex();
			}
		}
	}

	static class MyRunnableA implements Runnable {

		@Override
		public void run() {
			for (int c = 0; c < 10000; c++) {
				ai.incrementAndGet();
			}
		}
	}

	static class MyRunnable implements Runnable {
		@Override
		public void run() {
			for (int c = 0; c < 10000; c++) {
				i++;
			}
		}
	}

	static class MyRunnableS implements Runnable {
		@Override
		public void run() {
			for (int c = 0; c < 10000; c++) {
				inciSynchronized();
			}
		}
	}

	static class MyRunnableV implements Runnable {

		@Override
		public void run() {
			for (int c = 0; c < 10000; c++) {
				vd.increaseCounter();
			}
		}
	}


	public static void main(final String[] args) {
		final long start = System.nanoTime();
		final Thread t1 = new Thread(new MyRunnableV());
		final Thread t2 = new Thread(new MyRunnableV());
		t1.start();
		t2.start();
		try {
			t1.join();
			t2.join();
		}
		catch (final InterruptedException e) {
			e.printStackTrace();
		}
		// i = vd.getCounter(); // for RunnableV --> no caching but not update
		// protection

		// i = ai.get(); // for RunnableA

		// i = vd.ai.get(); // volatile + atomic

		// nothing for RunnableM / RunnableS

		System.out.println(i + " Nanotime: " + (System.nanoTime() - start));
	}

}
